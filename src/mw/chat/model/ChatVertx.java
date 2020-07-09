package mw.chat.model;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;

import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

import mw.member.model.MemberDAO;
import mw.member.model.MemberDTO;
import mw.moneyio.model.MoneyioDAO;
import mw.moneyio.model.MoneyioDTO;

public class ChatVertx extends DefaultEmbeddableVerticle {
	private static SocketIOServer io = null;
	
	
	SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
	DecimalFormat formatter = new DecimalFormat("###,###.##");
	
	// moneyioDAO, DTO, List 생성(호출)
	@Autowired
	private MoneyioDAO moDAO = null;
	private MoneyioDTO moDTO = new MoneyioDTO();
	public List moAllList = new ArrayList();		// 모든 내역 목록 저장
	public List moReList = new ArrayList();			// 일자별 마지막 내역 저장

	int remainAgo_1;
	int remainAgo_2;
	int before_remain;
	
	// memberDAO, DTO, List 생성(호출)
	@Autowired
	private MemberDAO meDAO = null;
	private MemberDTO meDTO = new MemberDTO();
	public List meAllList = new ArrayList();
	
	
	@Override
	public void start(Vertx vertx) {
		int port = 12345;
		
		HttpServer server = vertx.createHttpServer();
		
		io = new DefaultSocketIOServer(vertx, server);
		
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {
				
				socket.on("msg", new Handler<JsonObject>() {	// 요청(채팅실행)될 때마다 실행
					public void handle(JsonObject event) {
						Date time = new Date();									//////// new 객체가 계속 생성되어도 괜찮은건가???????
						
						String nowTime = formatTime.format(time);
						
						event.putString("nowTime", nowTime);
						
						
						System.out.println("id : " + event.getString("id"));
						
						String id = event.getString("id");
						
						moAllList = moDAO.moneyioListAll(id);	// 메시지 보낸 사용자에 대한 입출력내역 목록 가져오기
						moReList = moDAO.moneyioListRemain(id);	// 메시지 보낸 사용자에 대한 입출력내역의 일자별 마지막 내역 가져오기
						
						meDTO = meDAO.modifyCheck(id);			// 메시지 보낸 사용자에 대한 회원정보 가져오기
						
						System.out.println("id2 : " + meDTO.getId());
						
						String userMsg = "";
						userMsg = event.getString("msg"); 	// 회원이 보낸 채팅메시지
						
						
						
						
						
						
						
// callback Method 사용? (파라미터: userMsg, id, meDTO, moAllList .. 등 // 반환값: adminRe)
// ########################################################################################################
// 키워드 처리 // 답 메시지 저장	// Key,Value
						if(userMsg.contains("안녕") || userMsg.contains("하이") || userMsg.contains("ㅎㅇ")) {
			// 인사(1)
							event.putString("adminRe", "그래, 안녕");
							
						}else if(userMsg.contains("잘가") || userMsg.contains("바이")
								|| userMsg.contains("갈게") || userMsg.contains("ㅂㅇ")) {
			// 인사(2)
							event.putString("adminRe", "그래, 잘가");
							
						}else if((userMsg.contains("ID") || userMsg.contains("id") || userMsg.contains("아이디"))
								&& userMsg.contains("찾아") || userMsg.contains("뭐야")) {
			// 회원 ID 알림
							event.putString("adminRe", "회원님의 아이디는 [ "+ id + " ] 입니다.");		
							
						}else if((userMsg.contains("현재") || userMsg.contains("지금")) ||
								(userMsg.contains("남아있") || userMsg.contains("남은") || userMsg.contains("있어")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || 
										userMsg.contains("얼마") || userMsg.contains("돈")) ) {
			// 남은 잔액 알림							
							moDTO = (MoneyioDTO)moAllList.get(0);		// 가장 최근 내역
							event.putString("adminRe", id + " 님의 현재 남은 잔액은 " + formatter.format(moDTO.getIo_remain())  + " 원 입니다.");		
							
						}else if((userMsg.contains("어제") || userMsg.contains("전날")
								 || userMsg.contains("하루 전") || userMsg.contains("1일 전")) &&
								(userMsg.contains("사용") || userMsg.contains("소비") || userMsg.contains("썻") ||
									userMsg.contains("쓴") || userMsg.contains("썼") || userMsg.contains("지출")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || userMsg.contains("얼마")
									|| userMsg.contains("돈")) ) {
			// 어제(전날) 지출 금액 알림	
							moDTO = (MoneyioDTO)moReList.get(1);		// 1일 전 마지막 내역 저장
							remainAgo_1 = moDTO.getIo_remain();		// 1일 전 남은 잔액
							moDTO = (MoneyioDTO)moReList.get(2);		// 2일 전 마지막 내역 저장
							remainAgo_2 = moDTO.getIo_remain();		// 2일 전 남은 잔액
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1일 전에 지출한 잔액
							
							event.putString("adminRe", id + " 님은 어제 사용하신 금액 " + formatter.format(before_remain)  + "원 입니다.");		
							
						}else if((userMsg.contains("그제") || userMsg.contains("이튿날")
								 || userMsg.contains("그저께") || userMsg.contains("2일 전")) &&
								(userMsg.contains("사용") || userMsg.contains("소비") || userMsg.contains("썻") ||
									userMsg.contains("쓴") || userMsg.contains("썼") || userMsg.contains("지출")) && 
								(userMsg.contains("잔액") || userMsg.contains("금액") || userMsg.contains("얼마")
									|| userMsg.contains("돈")) ) {
			// 그제(이튿날) 지출 금액 알림	
							moDTO = (MoneyioDTO)moReList.get(2);		// 1일 전 마지막 내역 저장
							remainAgo_1 = moDTO.getIo_remain();		// 1일 전 남은 잔액
							moDTO = (MoneyioDTO)moReList.get(3);		// 2일 전 마지막 내역 저장
							remainAgo_2 = moDTO.getIo_remain();		// 2일 전 남은 잔액
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1일 전에 지출한 잔액
							
							event.putString("adminRe", id + " 님은 어제 사용하신 금액 " + formatter.format(before_remain)  + "원 입니다.");		
							
						}else if( userMsg.contains("금리") ) {
			// 금융지식(1) '금리'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>금리란, <br />"
									+ "원금에 지급되는 기간당 이자를 비율로 표시한 것.<br />"
									+ "금리가 내려가면 이자소득으로 살아가는 사람들이 어려워진다.<br />"
									+ "그러나 돈을 빌려서 사업을 하는 사람들에게는 자금조달 비용이 내려가기 때문에 환영을 받는다.<br />"
									+ "금리는 주식가격이나 주택가격에도 영향을 준다.<br />"
									+ "금리가 내려가면 자금 조달비용이 낮아지기 때문에 사람들은 주식이나 주택을 구입할 수 있는 능력이 커진다.<br />"
									+ "이와 같이 금리는 경제활동과 물가에 영향을 주고 외국과의 금리 차이가<br />"
									+ "국가간 자본이동에도 영향을 주기 때문에 환율에도 영향을 준다.</a>"
							);		
							
						}else if( userMsg.contains("환율") ) {
			// 금융지식(2) '환율'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>환율이란, <br />"
									+ "외국 돈을 살 때 지불하는 외국 돈의 가격을 환율이라 한다.<br />" 
									+ "환율 상승 즉 원화 약세는 수출에 유리한 영향을 미친다.<br />"
									+ "환율이 상승하면 수출품의 국제시장 가격이 하락하기 때문에<br />"
									+ "수출이 증가하고 반대로 수입 상품의 가격은 상승하기 때문에<br />"
									+ "수입이 줄어들어 국제 수지 개선에 도움을 준다.<br />"
									+ "따라서 환율 상승은 경제성장이나 경기회복에 도움을 줄 수 있다.</a>"
							);		
							
						}else if( userMsg.contains("채권") ) {
			// 금융지식(3) '채권'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>채권이란,<br />"
									+ "채권은 신용도가 높은 발행주체(정부, 공공기관, 특수법인과 또는 주식회사 등)가<br />"
									+ "일반 투자자들로부터 비교적 장기의 자금을 집단적, 대량적으로 조달하기 위하여<br />"
									+ "발행하는 유가증권으로서 일종의 차용증서이다.<br />"
									+ "채권은 원금은 물론 일정한 이자를 지급받을 권리가 주어져 있는 유가증권이기 때문에<br />"
									+ "수익성과 원금과 이자를 확실하게 받을 수 있는 안정성과 중도에 돈이 필요할 때<br />"
									+ "현금화 가능여부인 유동성이 특징이다.</a>"
							);		
							
						}else if( userMsg.contains("주식") ) {
			// 금융지식(4) '주식'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>주식이란, <br />"
									+ "주식회사는 자본단체이므로 자본이 없이는 성립할 수 없다.<br />"
									+ "자본은 사원인 주주의 출자이며, 권리와 의무의 단위로서의 주식으로 나누어진다.<br />"
									+ "따라서 주식에는 자본을 구성하는 분자로서의 금액의 뜻과,<br />"
									+ "주주의 회사에 대한 권리·의무의 단위인 주주권으로서의 뜻이 있다.</a>"
							);		
							
						}else if( userMsg.contains("금융상품") ) {
			// 금융지식(5) '금융상품'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>금융상품이란, <br />"
									+ "금융상품은 투자성이 있는 금융투자상품과 투자성이 없는 비금융투자상품으로 나눌 수 있다.<br />"
									+ "여기서 투자성이란 투자한 원금의 손실 가능성이 있는 경우를 말한다.<br />"
									+ "금융투자상품은 장래에 이익을 얻거나 손실을 회피할 수 있도록 해주는 금융상품을 말하는데,<br />"
									+ "투자에 대한 성과를 얻을 수 있지만, 손실을 볼 위험도 있다.<br />"
									+ "금융투자상품 중 원금까지만 손실이 발생할 가능성이 있는 것에는<br />"
									+ "주식, 채권, 펀드 등이 있고, 원금을 초과하여 손실이 발생할 가능성이 있는 것으로<br />"
									+ "파생상품 등이 있다.</a>"
							);		
							
						}else if( userMsg.contains("펀드") ) {
			// 금융지식(6) '펀드'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>펀드란, <br />"
									+ "펀드란 다수인으로부터 자금을 모아 주식, 채권, 기타 금융상품에 나누어 투자하고<br />"
									+ "그에 따른 수익 또는 손실 등의 결과를 다시 투자자에게 배분하는 투자상품을 말한다.<br />"
									+ "투자자 입장에서 소액 자금으로도 금융시장에 참여할 수 있으며<br />"
									+ "풍부한 경험과 전문 지식을 가진 자산운용사들이 투자자를 대신하여<br />"
									+ "자산을 운용하므로 전문적인 투자와 위험의 분산이라는 장점을 누릴 수 있다.</a>"
							);		
							
						}else if( userMsg.contains("재테크") ) {
			// 금융지식(7) '재테크'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>재테크란, <br />"
									+ "재무라는 의미의 '재(財)'와 기술을 의미하는<br />"
									+ "테크놀로지(technology)의 앞부분인 '테크(tech)'를 합성하여 만든 단어인 재테크는<br />"
									+ "사회에서 편의상 통용되는 단어로서 그중에서도 가장 일반적인 재테크의 의미는<br />"
									+ "투자를 통해 돈을 벌거나 재산을 불리는 방법으로 인식되고 있다.</a>"
							);		
							
						}else if( userMsg.contains("부동산") ) {
			// 금융지식(8) '부동산'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>부동산이란, <br />"
									+ "토지 및 그 정착물을 말하며, 입목도 독립한 부동산으로 보는 경우가 있다.<br />"
									+ "부동산 이외의 물건을 동산이라 하는데 차이점은 다음과 같다.<br />"
									+ "① 경제적 가치 : 부동산이 고가인 경우가 많다<br />"
									+ "② 장소 : 부동산의 소재가 일정하며 소재변경이 곤란하다<br />"
									+ "③ 공시방법 : 부동산은 등기가 물권변동의 효력발생요건으로 되어 있으며<br />"
									+ "시효취득·선의취득·다른 물권의 설정 등에 관해 가장 뚜렷한 특색을 갖는다</a>"
							);		
							
						}else if( userMsg.contains("자산배분") ) {
			// 금융지식(9) '자산배분'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>자산배분이란, <br />"
									+ "전술적 자산배분과 전략적 자산배분으로 나눌 수 있다.<br />"
									+ "전술적 자산배분은,<br />"
									+ "자산운용자가 변화하는 시장상황에 대응하고 이를 적절히 이용하기 위해,<br />"
									+ "시장에 대한 전망을 바탕으로 전략적자산배분이 정하는 범위에서 자산구성 비율을 조정하는 것을 말한다.<br />"
									+ "전략적 자산배분은,<br />"
									+ "수익성, 안정성, 중·장기 부채 현황 등을 종합적으로 고려하여<br />"
									+ "운용 자산별 비중, 만기 구조, 신용투자 규모 등에 대해 중·장기 자산운용 정책을 수립하는 것을 의미하며,<br />"
									+ "기관투자가의 효과적인 자산운용 방법에서 가장 핵심이 되는 사항이다.</a>"
							);		
							
						}else{
			// 키워드 조건에 해당되지 않는 질문에 대한 답		
							event.putString("adminRe", "다시 입력해주세요.");
							
						}
// ########################################################################################################
						
						System.out.println("handler ::: " + event.getString("msg"));
						System.out.println("handler ::: " + event.getString("adminRe"));

						io.sockets().emit("response", event);
 
					}
				});
				
			}
		});
		
		server.listen(port);		// 서버 실행
	}
	
}
