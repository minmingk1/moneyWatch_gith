package mw.account_card.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Account_cardDAO {

	private SqlSessionTemplate sqlSession = null;
	
	public Account_cardDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// ȸ���� ����ϴ� ī��/����
	public void insert(Account_cardDTO acdto) {
		sqlSession.insert("account_card.ac_insert",acdto);
	}
	
	// ī������ �̹��� ���		
	public void card_img_insert(Card_imgDTO cdto) {
		sqlSession.insert("account_card.card_img_insert",cdto);
	}
	
	// ī������ ��������
	public List card_select() {
		
		List card_list = new ArrayList();
		card_list = sqlSession.selectList("account_card.card_select");
		
		return card_list;
	}
	
	// ī��ȸ��  �� ī���̸� �������� 
	public List card_cn_select(String cardName) {
		
		List card_cn_list = new ArrayList();
		card_cn_list = sqlSession.selectList("account_card.card_cn",cardName);
		
		return card_cn_list;
	}
	
	// ī��� ��������
	public List card_company_select() {
		
		List card_company_list = new ArrayList();
		card_company_list = sqlSession.selectList("account_card.card_company");
		
		return card_company_list;
	}
	
	// ī����� ���� ī������ ��������
	public List card_benefit_select(String cardName) {
		
		List card_benefit_list = new ArrayList();
		card_benefit_list = sqlSession.selectList("account_card.card_benefit",cardName);
		
		return card_benefit_list;
	}
	
	//ī�� �̹���
	public List card_img() {
		
		List card_img = new ArrayList();
		card_img = sqlSession.selectList("account_card.card_img");
		
		return card_img;
	}

	
	
}