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

import mw.account_card.model.Account_cardDAO;
import mw.account_card.model.Reg_AccountDTO;
import mw.account_card.model.Reg_CardDTO;
import mw.calendar.model.MwScheduleDAO;
import mw.member.model.MemberDAO;
import mw.member.model.MemberDTO;
import mw.moneyio.model.MoneyioDAO;
import mw.moneyio.model.MoneyioDTO;

public class ChatVertx extends DefaultEmbeddableVerticle {
	private static SocketIOServer io = null;
	
	
	SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
	DecimalFormat formatter = new DecimalFormat("###,###.##");
	
	// moneyioDAO, DTO, List ����(ȣ��)
	@Autowired
	private MoneyioDAO moDAO = null;
	private MoneyioDTO moDTO = new MoneyioDTO();
	List moAllList = new ArrayList();		// ��� ���� ��� ����
	List moReList = new ArrayList();			// ���ں� ������ ���� ����

	int remainAgo_1;
	int remainAgo_2;
	int before_remain;
	
	// memberDAO, DTO, List ����(ȣ��)
	@Autowired
	private MemberDAO meDAO = null;
	private MemberDTO meDTO = new MemberDTO();
	List<MemberDTO> meAllList = new ArrayList();
	
	private Reg_AccountDTO radto = new Reg_AccountDTO();
	List<Reg_AccountDTO> acclist = new ArrayList();
	
	// cardDAO, DTO, List ����(ȣ��)
	@Autowired
	private Account_cardDAO caDAO = null;
	private Reg_CardDTO caDTO = new Reg_CardDTO();
	List<Reg_CardDTO> caRank20 = new ArrayList();
	List<Reg_CardDTO> caRank30 = new ArrayList();
	List<Reg_CardDTO> caRank40 = new ArrayList();
	String caRank20_company;
	String caRank30_company;
	String caRank40_company;
	String caRank20_name;
	String caRank30_name;
	String caRank40_name;
	
	
	int todayOutMoney = 0;
	
	@Autowired
	private MwScheduleDAO schDAO = null;
	String todayMemo = "��������";
	
	@Override
	public void start(Vertx vertx) {
		int port = 12345;
		
		HttpServer server = vertx.createHttpServer();
		
		io = new DefaultSocketIOServer(vertx, server);
		
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {
				
				socket.on("msg", new Handler<JsonObject>() {	// ��û(ä�ý���)�� ������ ����
					public void handle(JsonObject event) {
						
						String userMsg = "";
						userMsg = event.getString("msg"); 	// ȸ���� ���� ä�ø޽���
						
// #####################################################################################################################
				// DB Select �� �����͸� �������� ���� ����		
						// ä�� �Է��� �ð�(��/��) 
						Date time = new Date();
						String nowTime = formatTime.format(time);
						event.putString("nowTime", nowTime);
						
						// ä�� �Է��� ȸ���� ID ����
						String id = event.getString("id");
						
						// ȸ���� ���¹�ȣ���� ��������
						acclist = moDAO.myAccount(id);
						
						// ȸ���� ù��° ���¹�ȣ ��������
						String account;
						if(acclist.size() != 0) {
							account = acclist.get(0).getAccount_num();
						}
						
						// �޽��� ���� ����ڿ� ���� ����³����� ���ں� ������ ���� ��������
						moReList = moDAO.moneyioListRemain(id);
						// �޽��� ���� ����ڿ� ���� ȸ������ ��������
						meDTO = meDAO.modifyCheck(id);			
						
						
						// ȸ���� ���� �ܾ�
						int ioAllRemain;
						try {
							ioAllRemain = moDAO.ioAllRemain(id);
						}catch(Exception e){
							ioAllRemain = 0; 
						}
						
						// ���ɴ� �� ī�� ���� ��������
						caRank20 = (List)caDAO.card_rank(caDTO).get("rankList_20");
						caRank30 = (List)caDAO.card_rank(caDTO).get("rankList_30");
						caRank40 = (List)caDAO.card_rank(caDTO).get("rankList_40");
						
						caRank20_company = caRank20.get(0).getCard_company();
						caRank20_name = caRank20.get(0).getCard_name();
						
						caRank30_company = caRank30.get(0).getCard_company();
						caRank30_name = caRank30.get(0).getCard_name();
						
						caRank40_company = caRank40.get(0).getCard_company();
						caRank40_name = caRank40.get(0).getCard_name();
						
						
						if(caRank20_company == null) {
							caRank20_company = " - ";
							caRank20_name = " - ";
						}
						if(caRank30_company == null) {
							caRank30_company = " - ";
							caRank30_name = " - ";
						}
						if(caRank40_company == null) {
							caRank40_company = " - ";
							caRank40_name = " - ";
						}
						
						// ���� ����� ��������
						try {
							todayOutMoney = moDAO.todayOutMoney(id);
						}catch(Exception e) {
							todayOutMoney = 0;
						}
						
						// ���� ���� ��������
						todayMemo = schDAO.todayMemo(id);
						if(todayMemo==null) {
							todayMemo = "��������";
						}
						
						
						
// callback Method ���? (�Ķ����: userMsg, id, meDTO, moAllList .. �� // ��ȯ��: adminRe)
// ########################################################################################################
// Ű���� ó�� // �� �޽��� ����	// Key,Value
						
						if(userMsg.contains("�ȳ�") || userMsg.contains("����") || userMsg.contains("����")) {
			// �λ�(1)
							event.putString("adminRe", "�ȳ��ϼ���.");
							
						}else if(userMsg.contains("�߰�") || userMsg.contains("����")
								|| userMsg.contains("����") || userMsg.contains("�� �־�")
								|| userMsg.contains("���־�")  || userMsg.contains("����")) {
			// �λ�(2)
							event.putString("adminRe", "�ȳ��� ���ʽÿ�");
							
						}else if((userMsg.contains("ID") || userMsg.contains("id") || userMsg.contains("���̵�"))
								&& userMsg.contains("��") || userMsg.contains("�˷���") || userMsg.contains("ã��")
								|| userMsg.contains("��") || userMsg.contains("����")) {
			// ȸ�� ID �˸�
							event.putString("adminRe", "ȸ������ ���̵�� [ "+ id + " ] �Դϴ�.");		
							
						}else if((userMsg.contains("����") || userMsg.contains("����")) ||
								(userMsg.contains("������") || userMsg.contains("����") || userMsg.contains("�־�")) && 
								(userMsg.contains("�ܾ�") || userMsg.contains("�ݾ�") || 
										userMsg.contains("��") || userMsg.contains("��")) ) {
			// ���� �ܾ� �˸�			
							
							event.putString("adminRe", id + " ���� ���� ���� �ܾ��� "
							+ formatter.format(ioAllRemain)  + " �� ���� �ֽ��ϴ�.");
							
						}else if((userMsg.contains("����") || userMsg.contains("����")
								 || userMsg.contains("�Ϸ� ��") || userMsg.contains("1�� ��")) &&
								(userMsg.contains("���") || userMsg.contains("�Һ�") || userMsg.contains("��") ||
									userMsg.contains("��") || userMsg.contains("��") || userMsg.contains("����")) && 
								(userMsg.contains("�ܾ�") || userMsg.contains("�ݾ�") || userMsg.contains("��")
									|| userMsg.contains("��")) ) {
			// ����(����) ���� �ݾ� �˸�	
							moDTO = (MoneyioDTO)moReList.get(1);		// 1�� �� ������ ���� ����
							remainAgo_1 = moDTO.getIo_remain();		// 1�� �� ���� �ܾ�
							moDTO = (MoneyioDTO)moReList.get(2);		// 2�� �� ������ ���� ����
							remainAgo_2 = moDTO.getIo_remain();		// 2�� �� ���� �ܾ�
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1�� ���� ������ �ܾ�
							
							event.putString("adminRe", id + " ���� ���� ����Ͻ� �ݾ� " + formatter.format(before_remain)  + "�� �Դϴ�.");		
							
						}else if((userMsg.contains("����") || userMsg.contains("��Ʊ��")
								 || userMsg.contains("������") || userMsg.contains("2�� ��")) &&
								(userMsg.contains("���") || userMsg.contains("�Һ�") || userMsg.contains("��") ||
									userMsg.contains("��") || userMsg.contains("��") || userMsg.contains("����")) && 
								(userMsg.contains("�ܾ�") || userMsg.contains("�ݾ�") || userMsg.contains("��")
									|| userMsg.contains("��")) ) {
			// ����(��Ʊ��) ���� �ݾ� �˸�	
							moDTO = (MoneyioDTO)moReList.get(2);		// 1�� �� ������ ���� ����
							remainAgo_1 = moDTO.getIo_remain();		// 1�� �� ���� �ܾ�
							moDTO = (MoneyioDTO)moReList.get(3);		// 2�� �� ������ ���� ����
							remainAgo_2 = moDTO.getIo_remain();		// 2�� �� ���� �ܾ�
							
							before_remain = remainAgo_2 - remainAgo_1;	// 1�� ���� ������ �ܾ�
							
							event.putString("adminRe", id + " ���� ���� ����Ͻ� �ݾ� " + formatter.format(before_remain)  + "�� �Դϴ�.");		
							
						}else if( userMsg.contains("�ݸ�") ) {
			// ��������(1) '�ݸ�'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>�ݸ���, <br />"
									+ "���ݿ� ���޵Ǵ� �Ⱓ�� ���ڸ� ������ ǥ���� ��.<br />"
									+ "�ݸ��� �������� ���ڼҵ����� ��ư��� ������� ���������.<br />"
									+ "�׷��� ���� ������ ����� �ϴ� ����鿡�Դ� �ڱ����� ����� �������� ������ ȯ���� �޴´�.<br />"
									+ "�ݸ��� �ֽİ����̳� ���ð��ݿ��� ������ �ش�.<br />"
									+ "�ݸ��� �������� �ڱ� ���޺���� �������� ������ ������� �ֽ��̳� ������ ������ �� �ִ� �ɷ��� Ŀ����.<br />"
									+ "�̿� ���� �ݸ��� ����Ȱ���� ������ ������ �ְ� �ܱ����� �ݸ� ���̰�<br />"
									+ "������ �ں��̵����� ������ �ֱ� ������ ȯ������ ������ �ش�.</a>"
							);		
							
						}else if( userMsg.contains("ȯ��") ) {
			// ��������(2) 'ȯ��'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>ȯ���̶�, <br />"
									+ "�ܱ� ���� �� �� �����ϴ� �ܱ� ���� ������ ȯ���̶� �Ѵ�.<br />" 
									+ "ȯ�� ��� �� ��ȭ �༼�� ���⿡ ������ ������ ��ģ��.<br />"
									+ "ȯ���� ����ϸ� ����ǰ�� �������� ������ �϶��ϱ� ������<br />"
									+ "������ �����ϰ� �ݴ�� ���� ��ǰ�� ������ ����ϱ� ������<br />"
									+ "������ �پ��� ���� ���� ������ ������ �ش�.<br />"
									+ "���� ȯ�� ����� ���������̳� ���ȸ���� ������ �� �� �ִ�.</a>"
							);		
							
						}else if( userMsg.contains("ä��") ) {
			// ��������(3) 'ä��'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>ä���̶�,<br />"
									+ "ä���� �ſ뵵�� ���� ������ü(����, �������, Ư�����ΰ� �Ǵ� �ֽ�ȸ�� ��)��<br />"
									+ "�Ϲ� �����ڵ�κ��� ���� ����� �ڱ��� ������, �뷮������ �����ϱ� ���Ͽ�<br />"
									+ "�����ϴ� �����������μ� ������ ���������̴�.<br />"
									+ "ä���� ������ ���� ������ ���ڸ� ���޹��� �Ǹ��� �־��� �ִ� ���������̱� ������<br />"
									+ "���ͼ��� ���ݰ� ���ڸ� Ȯ���ϰ� ���� �� �ִ� �������� �ߵ��� ���� �ʿ��� ��<br />"
									+ "����ȭ ���ɿ����� �������� Ư¡�̴�.</a>"
							);		
							
						}else if( userMsg.contains("�ֽ�") ) {
			// ��������(4) '�ֽ�'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>�ֽ��̶�, <br />"
									+ "�ֽ�ȸ��� �ں���ü�̹Ƿ� �ں��� ���̴� ������ �� ����.<br />"
									+ "�ں��� ����� ������ �����̸�, �Ǹ��� �ǹ��� �����μ��� �ֽ����� ����������.<br />"
									+ "���� �ֽĿ��� �ں��� �����ϴ� ���ڷμ��� �ݾ��� ���,<br />"
									+ "������ ȸ�翡 ���� �Ǹ����ǹ��� ������ ���ֱ����μ��� ���� �ִ�.</a>"
							);		
							
						}else if( userMsg.contains("������ǰ") ) {
			// ��������(5) '������ǰ'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>������ǰ�̶�, <br />"
									+ "������ǰ�� ���ڼ��� �ִ� �������ڻ�ǰ�� ���ڼ��� ���� ��������ڻ�ǰ���� ���� �� �ִ�.<br />"
									+ "���⼭ ���ڼ��̶� ������ ������ �ս� ���ɼ��� �ִ� ��츦 ���Ѵ�.<br />"
									+ "�������ڻ�ǰ�� �巡�� ������ ��ų� �ս��� ȸ���� �� �ֵ��� ���ִ� ������ǰ�� ���ϴµ�,<br />"
									+ "���ڿ� ���� ������ ���� �� ������, �ս��� �� ���赵 �ִ�.<br />"
									+ "�������ڻ�ǰ �� ���ݱ����� �ս��� �߻��� ���ɼ��� �ִ� �Ϳ���<br />"
									+ "�ֽ�, ä��, �ݵ� ���� �ְ�, ������ �ʰ��Ͽ� �ս��� �߻��� ���ɼ��� �ִ� ������<br />"
									+ "�Ļ���ǰ ���� �ִ�.</a>"
							);		
							
						}else if( userMsg.contains("�ݵ�") ) {
			// ��������(6) '�ݵ�'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>�ݵ��, <br />"
									+ "�ݵ�� �ټ������κ��� �ڱ��� ��� �ֽ�, ä��, ��Ÿ ������ǰ�� ������ �����ϰ�<br />"
									+ "�׿� ���� ���� �Ǵ� �ս� ���� ����� �ٽ� �����ڿ��� ����ϴ� ���ڻ�ǰ�� ���Ѵ�.<br />"
									+ "������ ���忡�� �Ҿ� �ڱ����ε� �������忡 ������ �� ������<br />"
									+ "ǳ���� ����� ���� ������ ���� �ڻ������� �����ڸ� ����Ͽ�<br />"
									+ "�ڻ��� ����ϹǷ� �������� ���ڿ� ������ �л��̶�� ������ ���� �� �ִ�.</a>"
							);		
							
						}else if( userMsg.contains("����ũ") ) {
			// ��������(7) '����ũ'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>����ũ��, <br />"
									+ "�繫��� �ǹ��� '��(�)'�� ����� �ǹ��ϴ�<br />"
									+ "��ũ�����(technology)�� �պκ��� '��ũ(tech)'�� �ռ��Ͽ� ���� �ܾ��� ����ũ��<br />"
									+ "��ȸ���� ���ǻ� ���Ǵ� �ܾ�μ� ���߿����� ���� �Ϲ����� ����ũ�� �ǹ̴�<br />"
									+ "���ڸ� ���� ���� ���ų� ����� �Ҹ��� ������� �νĵǰ� �ִ�.</a>"
							);		
							
						}else if( userMsg.contains("�ε���") ) {
			// ��������(8) '�ε���'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>�ε����̶�, <br />"
									+ "���� �� �� �������� ���ϸ�, �Ը� ������ �ε������� ���� ��찡 �ִ�.<br />"
									+ "�ε��� �̿��� ������ �����̶� �ϴµ� �������� ������ ����.<br />"
									+ "�� ������ ��ġ : �ε����� ���� ��찡 ����<br />"
									+ "�� ��� : �ε����� ���簡 �����ϸ� ���纯���� ����ϴ�<br />"
									+ "�� ���ù�� : �ε����� ��Ⱑ ���Ǻ����� ȿ�¹߻�������� �Ǿ� ������<br />"
									+ "��ȿ��桤������桤�ٸ� ������ ���� � ���� ���� �ѷ��� Ư���� ���´�</a>"
							);		
							
						}else if( userMsg.contains("�ڻ���") ) {
			// ��������(9) '�ڻ���'				
							event.putString("adminRe",
									"<a href='/moneyWatch/sense.mw' style='color: black'>�ڻ����̶�, <br />"
									+ "������ �ڻ��а� ������ �ڻ������� ���� �� �ִ�.<br />"
									+ "������ �ڻ�����,<br />"
									+ "�ڻ����ڰ� ��ȭ�ϴ� �����Ȳ�� �����ϰ� �̸� ������ �̿��ϱ� ����,<br />"
									+ "���忡 ���� ������ �������� �������ڻ����� ���ϴ� �������� �ڻ걸�� ������ �����ϴ� ���� ���Ѵ�.<br />"
									+ "������ �ڻ�����,<br />"
									+ "���ͼ�, ������, �ߡ���� ��ä ��Ȳ ���� ���������� ����Ͽ�<br />"
									+ "��� �ڻ꺰 ����, ���� ����, �ſ����� �Ը� � ���� �ߡ���� �ڻ��� ��å�� �����ϴ� ���� �ǹ��ϸ�,<br />"
									+ "������ڰ��� ȿ������ �ڻ��� ������� ���� �ٽ��� �Ǵ� �����̴�.</a>"
							);		
							
						}else if( userMsg.contains("��Ÿ") ) {
			// 				
							event.putString("adminRe","userClickEvent");	
							
						}else if( userMsg.contains("�� ī�� ����") ) {
			// 				
							event.putString("adminE",
									"<iframe src='./mycardList.mw' style='width:100%; height:200%;' "
									+ "marginwidth='0' marginheight='0' frameborder='0'></iframe>"
									);	
												
						}else if( userMsg.contains("ī�� ��õ") ) {
			// 				
							int rankCount = 1;
							event.putString("adminE",
									"<center>20�� ī�� 1��<br />" +								 
									rankCount + "�� - " + caRank20_company + " - " +  caRank20_name
									+ "<br /><br />30�� ī�� 1��<br />" +								 
									rankCount + "�� - " + caRank30_company + " - " +  caRank30_name
									+ "<br /><br />40�� ī�� 1��<br />" +								 
									rankCount + "�� - " + caRank40_company + " - " +  caRank40_name
									+ "<br /><br /><a href='./card_rank.mw' style='color:black;' target='_blank'>�ڼ��� ����</a></center>"
									);	
							
						}else if( userMsg.contains("���� ����� �� ����") ) {
			// 				
							event.putString("adminE","���� �����Ͻ� �ݾ��� " + formatter.format(todayOutMoney) + "�� �Դϴ�. <br />"
									+ "���� ������ [" + todayMemo + "] �Դϴ�. <br />"
									+ "<a href='./Calendar_sub.mw' style='color:black;' target='_blank'>�ڼ��� ����</a>");	
							
						}else if( userMsg.contains("Ű���� �ȳ�") ) {
			// 				
							event.putString("adminE",
									"\"�ȳ�\", \"����\" <br />" + 
									"\"�� ID�� �����ΰ���?\" <br />" + 
									"\"���� ���� �ܾ��� ���ֳ���?\" <br />" + 
									"\"�ݸ�\", \"ȯ��\", \"ä��\", \"�ֽ�\", " + 
									"\"������ǰ\", \"�ݵ�\", \"����ũ\", \"�ε���\", \"�ڻ�й�\""
									);	
							
						}else{
			// Ű���� ���ǿ� �ش���� �ʴ� ������ ���� ��		
							event.putString("adminRe", "�ٽ� �Է����ּ���.");
							
						}
// ########################################################################################################
						
						System.out.println("handler ::: " + event.getString("msg"));
						System.out.println("handler ::: " + event.getString("adminRe"));

						io.sockets().emit("response", event);
 
					}
				});
				
			}
		});
		
		server.listen(port);		// ���� ����
	}
	
}
