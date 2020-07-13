package mw.moneyio.model;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mw.account_card.model.Reg_AccountDTO;

@Controller
public class MoneyioBean {
	
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy.MM.dd");
	DecimalFormat formatter = new DecimalFormat("###,###.##");
	
	@Autowired
	private MoneyioDAO dao = null;
	
	ArrayList list = new  ArrayList();

	@RequestMapping("moneyioForm.mw")
	public String moneyioForm(HttpSession session, MoneyioDTO dto, Model model) {
		String id = (String)session.getAttribute("memId");
		dto.setId(id);
			
		List list_company = dao.account(id);
		List list_card = dao.card(id);
			
		/*
		 * System.out.println("list_company"+list_company);
		 * System.out.println("list_card"+list_card)
		 */;
			
		String[] card_list = new String[list_company.size()+list_card.size()];
		
		for(int i=0; i<list_company.size();i++) {
			card_list[i] = (String)list_company.get(i);
		}
		for(int i=list_company.size();i<list_company.size()+list_card.size();i++) {
			int j = 0;
			card_list[i] = (String)list_card.get(j);
			j++;
		}
			
		for(int i = 0; i < card_list.length; i++) {
			System.out.println("card_list["+i+"] : " + card_list[i]);
		}
			//System.out.println("card_list"+card_list);
			
			//System.out.println("card_list: "+card_list);
			
			//System.out.println(card_list.get(0));
			//System.out.println(card_list.get(1));
		model.addAttribute("memId", id);
		model.addAttribute("card_list", card_list);

		return "/moneyio/moneyioForm";
		}
		
		@RequestMapping("bankSelect.mw")
		public String bankSelect(My_cardDTO mdto, String id, String card_name, Model model/* , HttpServletRequest request */) {
			//System.out.println("id: "+mdto.getId());
			//System.out.println("mdtoCard_name() : " + mdto.getCard_name());
			System.out.println("mdto.getCard_name() : " + mdto.getCard_name());
			System.out.println("mdto.getId() : " + mdto.getId());
			
//			List<String> account_card = null;
//			List<String> account_company = null; 
//			List<String> la = new ArrayList();
			
			List account_company = dao.company_Account(id, card_name);
			List account_card = dao.card_Account(id, card_name);
				
			String[] card_Account = new String[account_company.size()+account_card.size()];
			
			
			for(int i=0; i<account_company.size();i++) {
				card_Account[i] = (String)account_company.get(i);
			}
			for(int i=account_company.size();i<account_company.size()+account_card.size();i++) {
				int j = 0;
				card_Account[i] = (String)account_card.get(j);
				j++;
			}
			
			for(int i = 0; i < card_Account.length; i++) {
				System.out.println("card_account["+i+"] : " + card_Account[i]);
			}
			
			
			
			
//			if(account_company != null) {
//				la.add(account_company.toString());
//			}
//				
//			if(account_card != null) {
//				la.add(account_card.toString());
//			}
			
			
			
//			for(int i=0; i<card_Account.length;i++) {
//				card_Account[i] = (String) la.get(i);
//				System.out.println("card_Account===="+card_Account[i]);
//			}
			
			
			//System.out.println("card_Account: "+card_Account);
			model.addAttribute("card_Account", card_Account);

			return "/moneyio/bankSelect";
		}
		
		@RequestMapping("remain.mw")
		public String remain(String id, String account_num, Model model) {
			
			//System.out.println("dto.io_account : " + mdto.getAccount_num());
			//System.out.println("dto.io_id : " + mdto.getId());
			
			String io_remain = dao.allMoney(id, account_num);
			System.out.println("io_remain: "+io_remain);
			model.addAttribute("io_remain", io_remain);
			return "/moneyio/remain";
		}
		
		@RequestMapping("nbreadForm.mw")
		public String nbreadForm(int nPeople, Model model) {

			model.addAttribute("nPeople", nPeople);
			
			return "/moneyio/nbreadForm";
		}
		

		@RequestMapping("moneyioPro.mw")
		public String moneyioPro(MoneyioDTO dto, NbreadDTO ndto,String id, HttpServletRequest request) {
			int io_old_remain = Integer.parseInt(request.getParameter("io_old_remain"));
			System.out.println("io_old_remain:"+io_old_remain);
			
			if(dto.getIo_set()==1) {
				dto.setIo_remain(io_old_remain-dto.getIo_price());
			}else {
				dto.setIo_remain(io_old_remain+dto.getIo_price());
			}
			
			dao.insert(dto);
			System.out.println("reg: "+dto.getIo_reg_date()); 
			
			if(dao.card_check(id, dto.getIo_account()) != 0) {
				dao.balanceUpdate(id, dto.getIo_account(),dto.getIo_remain());
				dao.balanceUpdateAccount(id, dto.getIo_account(), dto.getIo_remain());
			}else {
				dao.balanceUpdateAccount(id, dto.getIo_account(), dto.getIo_remain());
			}
			
			System.out.println("update 성공!");
			
			ndto.setIo_num(dto.getIo_num());
			ndto.setN_category(dto.getIo_category());
			
			if(dto.getIo_N_div()>0) {
				String[] n_debtor = request.getParameterValues("n_debtor");
				String[] n_price = request.getParameterValues("n_price");
				
				for(int i = 0; i < n_debtor.length; i++) {
					ndto.setN_debtor(n_debtor[i]);
					ndto.setN_price(n_price[i]);
					dao.n_insert(ndto);
				}
			}	
			System.out.println("getN_debtor: "+ndto.getN_debtor());
			return "/moneyio/moneyioPro";
		}

		//수정 폼 불러오기
		@RequestMapping("ioUpdateForm.mw")
		public String ioUpdateForm(HttpSession session, String id, String account_num, Model model, HttpServletRequest request) {
			
			String memId = (String)session.getAttribute("memId"); 
			int io_num = Integer.parseInt(request.getParameter("ioNum"));
			
			String balance = dao.allMoney(id, account_num);
			
			MoneyioDTO dto = dao.ioUpdateForm(io_num);
			
			if(dto.getIo_N_div() == 0) {
				dto.setIo_N_div(0);
			}
			model.addAttribute("balance", balance);
			model.addAttribute("memId", memId);
			model.addAttribute("dto", dto);
			
			return "/moneyio/ioUpdateForm";
		}
		

		@RequestMapping("ioUpdatePro.mw")
		public String ioUpdatePro(MoneyioDTO dto, NbreadDTO ndto,String id, String account_num, HttpServletRequest request) {
			
			int io_old_price = Integer.parseInt(request.getParameter("io_old_price"));
			int io_new_price = Integer.parseInt(request.getParameter("io_price"));
			
			int io_old_set = Integer.parseInt(request.getParameter("io_old_set"));
			int io_new_set = Integer.parseInt(request.getParameter("io_set"));
		
			//int differ = Math.abs(io_old_price - io_new_price); 
			
		
			if(io_new_price != io_old_price) {
				
				if(io_old_set != io_new_set) {
			
					if(io_new_set==1) {
						dto.setIo_remain(dto.getIo_remain()-io_old_price-io_new_price);
						
					}else { 
						dto.setIo_remain(dto.getIo_remain()+io_old_price+io_new_price);
						
					}
				}else {
					
					if(io_new_set==1) {
						dto.setIo_remain(dto.getIo_remain()+io_old_price-io_new_price);
					}else {
						dto.setIo_remain(dto.getIo_remain()-io_old_price+io_new_price);
					}
				}
			}
						// 39000 - 40000 //  // -1000
			System.out.println("dto.getIo_remain()"+dto.getIo_remain());
			System.out.println("dto.getIo_price()"+dto.getIo_price());
			
			dao.ioUpdatePro(dto);
			
			if(dao.card_check(id, dto.getIo_account()) != 0) {
				dao.balanceUpdate(id, dto.getIo_account(),dto.getIo_remain());
				dao.balanceUpdateAccount(id, dto.getIo_account(), dto.getIo_remain());
			}else {
				dao.balanceUpdateAccount(id, dto.getIo_account(), dto.getIo_remain());
			}
			System.out.println("update 성공!");
			if(dto.getIo_N_div()>0) {
				dao.n_delete(ndto.getIo_num());
				String[] n_debtor = request.getParameterValues("n_debtor");
				String[] n_price = request.getParameterValues("n_price");
				
				for(int i = 0; i < n_debtor.length; i++) {
					ndto.setN_debtor(n_debtor[i]);
					ndto.setN_price(n_price[i]);
					dao.n_insert2(ndto);
					System.out.println("ndto get n debtor"+ndto.getN_debtor());
				}
				
			}else {
				dao.n_delete(ndto.getN_num());
			}
			
			return "/moneyio/ioUpdatePro";
		}
		

		@RequestMapping("ageChart.mw")
		public String ageChart20(Model model, MoneyioDTO dto) {
			List<MoneyioDTO> chart_list20 = new ArrayList<MoneyioDTO>();
			List<MoneyioDTO> chart_list30 = new ArrayList<MoneyioDTO>();
			List<MoneyioDTO> chart_list40 = new ArrayList<MoneyioDTO>();
			
			chart_list20 = dao.ageChart20();
			chart_list30 = dao.ageChart30();
			chart_list40 = dao.ageChart40();

			model.addAttribute("chart_list20", chart_list20);
			model.addAttribute("chart_list30", chart_list30);
			model.addAttribute("chart_list40", chart_list40);
			return "/moneyio/ageChart";
		}
		
		
		@RequestMapping("ptEstimate.mw") //揶쏆뮇�뵥 占쎈꺖�뜮袁ⓦ걠嚥∽옙 �뵳�딅뮞占쎈뱜, 占쎈뼄占쎌벉占쎈뼎 占쎌굙占쎄맒 筌욑옙�빊�뮇釉� 
		public String ptEstimate(HttpSession session, Model model) {
			String id = (String)session.getAttribute("memId");
			int sum = 0;
			int sum1 = dao.sum5(id);
			int sum2 = dao.sum6(id);
			int sum3 = dao.sum7(id);
			
			List<MoneyioDTO> list1 = dao.ptEstimate5(id);
			List<MoneyioDTO> list2 = dao.ptEstimate6(id);
			List<MoneyioDTO> list3 = dao.ptEstimate7(id);
			List<MoneyioDTO> next_list = dao.nextMonth(id);
			
			for(int i=0; i<next_list.size();i++) {
				if(next_list.get(i).getCount3()==3) {
					int next = next_list.get(i).getIo_price()/3;
					sum = sum+next;
				}  
				if(next_list.get(i).getCount3()==2) {
					int next = next_list.get(i).getIo_price()/4;
					sum = sum + next;
				}
				if(next_list.get(i).getCount3()==1) {
					int next = next_list.get(i).getIo_price()/5;
					sum = sum + next;
				}
			}
			if(sum3-sum2 > 0) {
				int differ = sum3- sum2;
				sum = sum+ differ;
			}
			int estimate  = sum;
			
			System.out.println("sum_all: "+ estimate);

			model.addAttribute("memId", id);
			model.addAttribute("list1", list1);
			model.addAttribute("sum1", sum1);
			model.addAttribute("list2", list2);
			model.addAttribute("sum2", sum2);
			model.addAttribute("list3", list3);
			model.addAttribute("sum3", sum3);
			model.addAttribute("estimate", estimate);
			//MoneyioDTO dtoT = next_list.get(next_list.size()-1);
			//System.out.println("next_list: "+ dtoT.getCount3());
			return "/moneyio/ptEstimate";
		}
	
	
	@RequestMapping("moneyioList.mw")	
	public String moneyioList(HttpSession session, Model model) {
		Date date = new Date();
		String nowDate = formatDate.format(date);
		
		//String id = "k0725";
		String id = (String)session.getAttribute("memId");
		
		List<Reg_AccountDTO> acclist = new ArrayList();
		acclist = dao.myAccount(id);
		Reg_AccountDTO radto = new Reg_AccountDTO();
		String account = acclist.get(0).getAccount_num();
		
		List<MoneyioDTO> mlist = dao.moneyioListAll(id, account);
		int ioRemain = dao.ioRemain(id, account);
		
		model.addAttribute("myAcc", acclist);
		model.addAttribute("moneyioList", mlist);
		model.addAttribute("ioRemain", ioRemain);
		model.addAttribute("nowDate", nowDate);
		
		return "/moneyio/moneyioList";
	}
	
	@RequestMapping("ioList.mw")	
	public String ioList(String filter, String acc, Model model, HttpSession session) {
			
		//String id = "k0725"; 
		String id = (String)session.getAttribute("memId"); 
		List list = new ArrayList();
		
		if(filter.equals("all")) {
			list = dao.moneyioListAll(id, acc);
		}else if (filter.equals("inMoney")) {
			list = dao.moneyioListIn(id, acc);
		}else {
			list = dao.moneyioListOut(id, acc);
		}

		model.addAttribute("id",id);
		model.addAttribute("moneyioList", list);
		
		return "/moneyio/ioList";
	}
	
	@RequestMapping("ioListDetail.mw")
	public String ioListDetail(int ioNum, Model model, HttpSession session) {
		
		//String id = "k0725";
		String id = (String)session.getAttribute("memId"); 
		try {
			String n_check="내역이 없습니다.";
			
			NbreadDTO ndto = new NbreadDTO();
			List<NbreadDTO> nlist = dao.nList(ioNum);
			
			if(nlist.size()==0) {
				ndto.setN_num(0);
				ndto.setN_check(n_check);
				nlist.add(ndto);
			}else {
				String category = nlist.get(0).getN_category();
				String nSum = dao.nSum(ioNum);
				model.addAttribute("category", category);
				model.addAttribute("nSum", nSum);
			}
			
			MoneyioDTO dto = dao.moneyioListDetail(id, ioNum);

			model.addAttribute("dto", dto);
			model.addAttribute("nlist", nlist);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "/moneyio/ioListDetail";
	}
	
	@RequestMapping("ioDeletePro.mw")
	public String ioDeletePro(int io_num) {
		//System.out.println(io_num);
		dao.io_delete(io_num);
		return "redirect:moneyioList.mw";
	}
	
	@RequestMapping("ioRemain.mw")
	public @ResponseBody String ioRemain(String acc, HttpSession session) {
		//String id = "k0725";
		String id = (String)session.getAttribute("memId");
		int ioRemain = dao.ioRemain(id, acc);

		return formatter.format(ioRemain)+"";
	}
	
}
