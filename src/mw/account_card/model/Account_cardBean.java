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
	
	// ī��/���� ��� form
	@RequestMapping("account_cardForm.mw")
	public String Account_cardForm(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("memId");

		model.addAttribute("memId",id);
		
		return "/account_card/account_cardForm";
	}
	
	// ī��/���� ��� form - main
	@RequestMapping("account_cardForm_main.mw")
	public String Account_cardForm_main(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("memId");

		model.addAttribute("memId",id);
		
		return "/account_card/account_cardForm_main";
	}
	
	// ī��翡 ���� ī���̸� ����
	@RequestMapping("select_card.mw")
	public String select_cardName(String cardCompany, Model model){
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // ī���,ī��ȸ�� ����Ʈ
	
		model.addAttribute("cardCompany", cardCompany); // ī��ȸ��
		model.addAttribute("cardList", card_cn_list);
		
		return "/account_card/select_card";
	}
	
	// ���༱�� �� ���¹�ȣ �����ϴ� ĭ 
	@RequestMapping("bank.mw")
	public String select_bank(String bank_num, Model model) {
		
		model.addAttribute("bank_num",bank_num);
		return "/account_card/bank";
	}
	
	// ī��� �� ī��� �����ϴ� ĭ
	@RequestMapping("card.mw")
	public String select_card(String card_num, Model model) {
		
		List card_company_list = acdao.card_company_select(); // ī��ȸ�� ����Ʈ

		model.addAttribute("card_company_list",card_company_list);
		model.addAttribute("card_num",card_num);
		return "/account_card/card";
	}
	
	// ī�� �� ���µ��
	@RequestMapping("account_cardPro.mw")
	public String account_cardPro(HttpSession session, Model model,HttpServletRequest request,Reg_CardDTO cdto,Reg_AccountDTO adto) {
		
		int check = 0;
	
		String id = (String)session.getAttribute("memId");
		
		String ca_set = request.getParameter("ca_set");
		String set = request.getParameter("set"); // ���ο� �ִ� form�̶� ������������ �ִ� form�̶� �����ؼ� �ѱ�� ����
		
		if(ca_set.equals("0")) { // ī������ ��� 
			check = acdao.check_card(id, cdto.getCard_name(), cdto.getAccount_num()); //ī��� ���°� �����ϴ��� Ȯ��
			if(check == 0) {
				acdao.card_insert(cdto); // ī����
				acdao.account_insert(adto); // ���µ��
			}
		}
			
		if(ca_set.equals("1")){ // ���µ���� ���
			
			check = acdao.check_account(id,adto.getAccount_company(),adto.getAccount_num()); // ���°� �����ϴ��� Ȯ��
			
			if(check == 0) {
				acdao.account_insert(adto);
			}
		}
		
		model.addAttribute("check",check);
		model.addAttribute("set",set);
		
		return "/account_card/account_cardPro";
	}
	
	
	// ī�� �̹��� ����
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
		
			File [] fileList = dir.listFiles(); // �ش��ο� �����ϴ� ���� ����	
			
			for(File file : fileList) {// ����� ���ϸ�ŭ for�� ������ �� ��������	
				if(file.isFile()) {
					String fileName = file.getName();
					int index = fileName.lastIndexOf(".");
					int f = Integer.parseInt(fileName.substring(0,index)); // �����̸�(�����̸��� �� �̹�����ȣ)
				
					cdto.setImg_cnt(f);
					
					if(i==0) {
						cdto.setCompany("���ī��");
					}else if(i==1) {
						cdto.setCompany("�Ｚī��");
					}else if(i==2) {
						cdto.setCompany("����ī��");
					}else if(i==3) {
						cdto.setCompany("����ī��");
					}else if(i==4) {
						cdto.setCompany("�츮ī��");
					}else if(i==5) {
						cdto.setCompany("����ī��");
					}else if(i==6) {
						cdto.setCompany("�Ե�ī��");
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
	
	// ī��� ����(���ú��� ���� ��)
	@RequestMapping("card_benefit.mw")
	public String card_benefit(String cardCompany, Model model) {
		
		List card_company_list = acdao.card_company_select(); // ī��ȸ�� ����Ʈ

		model.addAttribute("card_company_list",card_company_list);
		
		return "/card_benefit/card_benefit";
	}
	
	// ī��� ����(���ú��� ���� ��)
	@RequestMapping("benefit_select.mw")
	public String benefit_select(String cardCompany, Model model) {
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // ī���,ī��ȸ�� ����Ʈ
		
		
		model.addAttribute("cardCompany", cardCompany); // ī��ȸ��
		model.addAttribute("cardList", card_cn_list);
		
		return "/card_benefit/benefit_select";
	}
	
	// ī�忡 ���� ����
	@RequestMapping("benefit.mw")
	public String benefit(String cardName, Model model) {
		
		List card_benefit_list = acdao.card_benefit_select(cardName); // ���õ� ī�忡 ���� ����
		String card_img = acdao.card_img(cardName);
		
		model.addAttribute("benefitList",card_benefit_list);
		model.addAttribute("cardImg",card_img); // ī���̹���
		
		return "/card_benefit/benefit";
		
	}
	
	// ���� ī�� �� ���� ����
	@RequestMapping("myCard.mw")
	public String myAccountCardForm(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		List mycard_list = (List) acdao.myCard(id).get("mycard");
		List myaccount_list = (List) acdao.myCard(id).get("myaccount");
		
		model.addAttribute("myCardList",mycard_list);
		model.addAttribute("myAccountList",myaccount_list);
		
		return "/account_card/myAccountCardForm";
	}
	
	// ī�� ����(��ϵǾ� �ִ� ���� �߿��� ����)
	@RequestMapping("updateCardForm.mw")
	public String updateCardForm(Reg_CardDTO cdto, Reg_AccountDTO adto, Model model) {
		
		Reg_CardDTO reg_card = acdao.getCard(cdto); // ������ ī�� ���ý� ����
		
		List reg_account = acdao.getAccount(adto); // ��ϵǾ� �ִ� ����� �ҷ�����
		
		model.addAttribute("reg_card",reg_card);
		model.addAttribute("reg_account",reg_account);
		
		return "/account_card/updateCardForm";
	}
	
	// ��ϵ� ī��ȸ�翡 ���� ���¹�ȣ
	@RequestMapping("account_num.mw")
	public String selectAccountNum(String account_company, Model model) {
		
		List getAccount_num = acdao.getAccount_num(account_company);
		
		model.addAttribute("getAccount_num", getAccount_num);
		
		return "/account_card/selectAccountNum";
	}
	
	@RequestMapping("updateCardPro.mw")
	public String updateCardPro(Reg_CardDTO cdto) {
		
		acdao.updateCard(cdto);
		
		return "/account_card/updateCardPro";
	}
	
	// ���� ī�����
	@RequestMapping("myCardDel.mw")
	public String myCardDel(HttpSession session, int num){
		
		String id = (String)session.getAttribute("memId");
		
		acdao.delMyCard(id, num);
		
		return "/account_card/myCardDelete";
	}
	
	// ���� ���� ����
	@RequestMapping("myAccountDel.mw")
	public String myAccountDel(HttpSession session,int num,String account_num){
			
		String id = (String)session.getAttribute("memId");
		
		acdao.delMyAccount(id, num);
		
		return "/account_card/myAccountDelete";
	}
	
	// ���� ī�� ���ú���
	@RequestMapping("mycardBenefit.mw")
	public String mycardBenefit(String card_name, Model model) {
		
		List myBenefit = acdao.mycard_benefit(card_name);
		String card_img = acdao.card_img(card_name);
		
		model.addAttribute("myBenefit",myBenefit); 
		model.addAttribute("card_name",card_name); // ī���̸�
		model.addAttribute("card_img", card_img);
		
		return "/card_benefit/MycardBenefit";
	}
	
	// ���� ī�� ����Ʈ - ���� ī�� ���������� ���� ����� ����
	@RequestMapping("mycardList.mw")
	public String mycardList(HttpSession session, String card_name,Model model){
		
		String id = (String)session.getAttribute("memId");
		//String id= "nahui068";
		List mycard = acdao.myCardList(id); // ���� ī���Ͽ� ���� ī���̹���
		
		model.addAttribute("mycard",mycard);
		
		return "/card_benefit/mycardList";
	}
	
	// ��ϵ� ī�� ����
	@RequestMapping("card_rank.mw")
	public String card_rank(Reg_CardDTO cdto, Model model) {
		
		List rankList_20 = (List) acdao.card_rank(cdto).get("rankList_20");
		List rankList_30 = (List) acdao.card_rank(cdto).get("rankList_30");
		List rankList_40 = (List) acdao.card_rank(cdto).get("rankList_40");
		
		model.addAttribute("rankList_20",rankList_20);
		model.addAttribute("rankList_30",rankList_30);
		model.addAttribute("rankList_40",rankList_40);
		
		return "/account_card/card_rank";
	}
	

}
