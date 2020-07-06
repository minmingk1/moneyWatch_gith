package mw.account_card.model;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Account_cardBean {

	@Autowired
	private Account_cardDAO acdao= null;
	
	// 카드/계좌 등록 form
	@RequestMapping("account_cardForm.mw")
	public String Account_cardForm(Model model, HttpSession session) {
		
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";

		model.addAttribute("memId",id);
		
		return "/account_card/account_cardForm";
	}
	
	// 카드사에 따른 카드이름 선택
	@RequestMapping("select_card.mw")
	public String select_cardName(String cardCompany, Model model){
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // 카드명,카드회사 리스트
	
		model.addAttribute("cardCompany", cardCompany); // 카드회사
		model.addAttribute("cardList", card_cn_list);
		
		return "/account_card/select_card";
	}
	
	// 은행선택 및 계좌번호 선택하는 칸 
	@RequestMapping("bank.mw")
	public String select_bank(String bank_num, Model model) {
		
		model.addAttribute("bank_num",bank_num);
		return "/account_card/bank";
	}
	
	// 카드사 및 카드명 선택하는 칸
	@RequestMapping("card.mw")
	public String select_card(String card_num, Model model) {
		
		List card_company_list = acdao.card_company_select(); // 카드회사 리스트

		model.addAttribute("card_company_list",card_company_list);
		model.addAttribute("card_num",card_num);
		return "/account_card/card";
	}
	
	// 카드 및 계좌등록
	@RequestMapping("account_cardPro.mw")
	public String account_cardPro(Model model,HttpServletRequest request,Reg_CardDTO cdto,Reg_AccountDTO adto) {
		
		int check = 0;
	
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		String ca_set = request.getParameter("ca_set");
		
		if(ca_set.equals("0")) { // 카드등록일 경우 
			check = acdao.check_card(id, cdto.getCard_name(), cdto.getAccount_num());
			if(check == 0) {
				acdao.card_insert(cdto); // 카드등록
				acdao.account_insert(adto); // 계좌등록
			}
		}
			
		if(ca_set.equals("1")){ // 계좌등록일 경우
			
			check = acdao.check_account(id,adto.getAccount_company(),adto.getAccount_num()); // 계좌가 존재하는지 확인
			
			if(check == 0) {
				acdao.account_insert(adto);
			}
		}
		
		model.addAttribute("check",check);

		return "/account_card/account_cardPro";
	}
	
	
	// 카드 이미지 삽입
	@RequestMapping("card_img_insert.mw")
	public String card_img_insert(Card_imgDTO cdto) {
		
		File dir = null;
		String [] path = new String[7];
		path[0] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_ibk";
		path[1] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_samsung";
		path[2] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_hyundai";
		path[3] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_shinhan";
		path[4] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_woori";
		path[5] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_kb";
		path[6] = "C:\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\moneyWatch\\image\\image_lotte";
		
		for(int i=0; i<path.length; i++) {
			dir = new File(path[i]);
		
			File [] fileList = dir.listFiles(); // 해당경로에 존재하는 파일 저장	
			
			for(File file : fileList) {// 저장된 파일만큼 for문 돌려서 값 가져오기	
				if(file.isFile()) {
					String fileName = file.getName();
					int index = fileName.lastIndexOf(".");
					int f = Integer.parseInt(fileName.substring(0,index)); // 파일이름(파일이름이 곧 이미지번호)
				
					cdto.setImg_cnt(f);
					
					if(i==0) {
						cdto.setCompany("기업카드");
					}else if(i==1) {
						cdto.setCompany("삼성카드");
					}else if(i==2) {
						cdto.setCompany("현대카드");
					}else if(i==3) {
						cdto.setCompany("신한카드");
					}else if(i==4) {
						cdto.setCompany("우리카드");
					}else if(i==5) {
						cdto.setCompany("국민카드");
					}else if(i==6) {
						cdto.setCompany("롯데카드");
					}
							
					String strpath = file.getPath();
					
					strpath = strpath.substring(87);
					strpath = strpath.replace("\\", "/");
					
					cdto.setPath(strpath);
				}
				acdao.card_img_insert(cdto);
			}
		
		}
		
		return "/account_card/card_img_insert";
	}
	
	// 카드사 선택(혜택보기 위한 것)
	@RequestMapping("card_benefit.mw")
	public String card_benefit(String cardCompany, Model model) {
		
		List card_company_list = acdao.card_company_select(); // 카드회사 리스트

		model.addAttribute("card_company_list",card_company_list);
		
		return "/card_benefit/card_benefit";
	}
	
	// 카드명 선택(혜택보기 위한 것)
	@RequestMapping("benefit_select.mw")
	public String benefit_select(String cardCompany, Model model) {
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // 카드명,카드회사 리스트
		
		
		model.addAttribute("cardCompany", cardCompany); // 카드회사
		model.addAttribute("cardList", card_cn_list);
		
		return "/card_benefit/benefit_select";
	}
	
	// 카드에 대한 혜택
	@RequestMapping("benefit.mw")
	public String benefit(String cardName, Model model) {
		
		List card_benefit_list = acdao.card_benefit_select(cardName); // 선택된 카드에 대한 혜택
		String card_img = acdao.card_img(cardName);
		
		model.addAttribute("benefitList",card_benefit_list);
		model.addAttribute("cardImg",card_img); // 카드이미지
		
		return "/card_benefit/benefit";
		
	}
	
	// 나의 카드 및 계좌 정보
	@RequestMapping("myCard.mw")
	public String myAccountCardForm(HttpSession session, Model model) {
		
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		List mycard_list = (List) acdao.myCard(id).get("mycard");
		List myaccount_list = (List) acdao.myCard(id).get("myaccount");
		
		model.addAttribute("myCardList",mycard_list);
		model.addAttribute("myAccountList",myaccount_list);
		
		return "/account_card/myAccountCardForm";
	}
	
	// 나의 카드삭제
	@RequestMapping("myCardDel.mw")
	public String myCardDel(int num){
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		acdao.delMyCard(id, num);
		
		return "/account_card/myCardDelete";
	}
	
	// 나의 계좌 삭제
	@RequestMapping("myAccountDel.mw")
	public String myAccountDel(int num){
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		acdao.delMyAccount(id, num);
		
		return "/account_card/myAccountDelete";
	}
	
	// 나의 카드 혜택보기
	@RequestMapping("mycardBenefit.mw")
	public String mycardBenefit(String card_name, Model model) {
		
		List myBenefit = acdao.mycard_benefit(card_name);
		String card_img = acdao.card_img(card_name);
		
		model.addAttribute("myBenefit",myBenefit); 
		model.addAttribute("card_name",card_name); // 카드이름
		model.addAttribute("card_img", card_img);
		
		return "/card_benefit/MycardBenefit";
	}
	
	// 나의 카드 리스트 - 나의 카드 혜택페이지 따로 만들기 위함
	@RequestMapping("mycardList.mw")
	public String mycardList(String card_name,Model model){
		
		String id= "nahui068";
		List mycard = acdao.myCardList(id); // 나의 카드목록에 대한 카드이미지
		
		model.addAttribute("mycard",mycard);
		
		return "/card_benefit/mycardList";
	}
	
	@RequestMapping("card_rank.mw")
	public String rank_20(Reg_CardDTO cdto, Model model) {
		
		List rankList = acdao.card_rank(cdto);
		model.addAttribute("rankList",rankList);
		
		return "/account_card/20card_rank";
	}
	

}
