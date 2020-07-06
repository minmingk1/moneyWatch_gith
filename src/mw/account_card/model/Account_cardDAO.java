package mw.account_card.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Account_cardDAO {

	private SqlSessionTemplate sqlSession = null;
	
	public Account_cardDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 회원 카드등록
	public void card_insert(Reg_CardDTO cdto) {
		sqlSession.insert("account_card.card_insert",cdto);
	}
	
	// 회원 계좌등록
	public void account_insert(Reg_AccountDTO adto) {
		sqlSession.insert("account_card.account_insert",adto);
	}
	
	// 카드정보 이미지 등록		
	public void card_img_insert(Card_imgDTO cdto) {
		sqlSession.insert("account_card.card_img_insert",cdto);
	}
	
	// 카드정보 가져오기
	public List card_select() {
		
		List card_list = new ArrayList();
		card_list = sqlSession.selectList("account_card.card_select");
		
		return card_list;
	}
	
	// 카드회사  및 카드이름 가져오기 
	public List card_cn_select(String cardName) {
		
		List card_cn_list = new ArrayList();
		card_cn_list = sqlSession.selectList("account_card.card_cn",cardName);
		
		return card_cn_list;
	}
	
	// 카드사 가져오기
	public List card_company_select() {
		
		List card_company_list = new ArrayList();
		card_company_list = sqlSession.selectList("account_card.card_company");
		
		return card_company_list;
	}
	
	// 카드명에 따른 카드혜택 가져오기
	public List card_benefit_select(String cardName) {
		
		List card_benefit_list = new ArrayList();
		card_benefit_list = sqlSession.selectList("account_card.card_benefit",cardName);
		
		return card_benefit_list;
	}
	
	//카드 이미지
	public String card_img(String cardName) {
			
		String card_img = sqlSession.selectOne("account_card.card_img",cardName);
		
		return card_img;
	}
	
	// 나의 카드 및 계좌정보 확인
	public HashMap myCard(String id) {
		
		List mycard = new ArrayList();
		List myaccount = new ArrayList();
		
		mycard = sqlSession.selectList("account_card.mycard",id);
		myaccount = sqlSession.selectList("account_card.myaccount",id);
		
		HashMap acmap = new HashMap();
		acmap.put("mycard",mycard);
		acmap.put("myaccount", myaccount);
		
		return acmap;
	}
	
	// 나의 카드 이미지 리스트
	public List myCardList(String id) {
		
		List mycard = new ArrayList();
		mycard = sqlSession.selectList("account_card.mycardList",id);
		
		return mycard;
	}
	
	// 나의 카드삭제
	public void delMyCard(String id, int num) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num",num);
		
		sqlSession.delete("account_card.mycard_del",map);
	}

	// 나의 계좌삭제
	public void delMyAccount(String id, int num) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num",num);
		
		sqlSession.delete("account_card.myaccount_del",map);
	}
	
	// 나의 카드 혜택보기 
	public List mycard_benefit(String ca_name) {
		
		List myBenefit = new ArrayList();
		myBenefit = sqlSession.selectList("account_card.my_ac_benefit",ca_name);
		
		return myBenefit;
	}
	
	// 계좌중복확인
	public int check_account(String id,String account_company, String account_num) {
		
		HashMap amap = new HashMap();
		amap.put("id", id);
		amap.put("account_company",account_company);
		amap.put("account_num", account_num);
	
		int check = sqlSession.selectOne("account_card.check_account",amap);
		return check;
	}
	
	// 카드에 대한 연결된 계좌 중복확인
	public int check_card(String id, String card_name, String account_num) {
		
		HashMap cmap = new HashMap();
		cmap.put("id",id);
		cmap.put("card_name", card_name);
		cmap.put("account_num",account_num);
		
		int check = sqlSession.selectOne("account_card.check_card",cmap);
		return check;
	}
	
	// 20대 카드 등록 순위
	public List card_rank(Reg_CardDTO cdto) {
		
		List rankList = sqlSession.selectList("account_card.20_cardRegisterCount",cdto);
		return rankList;
		
	}
	
}
