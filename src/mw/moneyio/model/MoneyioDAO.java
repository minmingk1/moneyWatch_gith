package mw.moneyio.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import mw.account_card.model.Reg_AccountDTO;

public class MoneyioDAO {
	
	private SqlSessionTemplate sqlSession = null;
	
	HashMap map = new HashMap();
	
	public MoneyioDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	//���� ī�帮��Ʈ
	public List<My_cardDTO> card(String id) {
		return sqlSession.selectList("moneyio.card", id);
	}
	public List<My_cardDTO> account(String id){
		return sqlSession.selectList("moneyio.account", id);
	}
	
	//���� ī�� ����
	public List card_Account(String id, String card_name) {
		//System.out.println(ca_company);
		//System.out.println("dao: "+mdto.getId());
		map.put("id", id);
		map.put("card_name", card_name);
		
		return sqlSession.selectList("moneyio.card_Account", map);
	}
	public List company_Account(String id, String account_company){
		map.put("id", id);
		map.put("account_company", account_company);
		
		return sqlSession.selectList("moneyio.company_Account", map);
	}
	
	//���� ���� �ܾ�
	public String allMoney(String id, String account_num) {
		map.put("id", id);
		map.put("account_num", account_num);
		return sqlSession.selectOne("moneyio.allMoney", map);
	}
	
	public int card_check(String id, String account_num) {
		map.put("id", id);
		map.put("account_num", account_num);
		return sqlSession.selectOne("moneyio.card_check", map);
	}
	//mwregistercard balance update
	public void balanceUpdate(String id, String account_num, int balance) {
		map.put("id", id);
		map.put("account_num", account_num);
		map.put("balance", balance);
		sqlSession.update("moneyio.balance_update", map);
	}
	
	// ���� �ܾ� ������Ʈ
	public void balanceUpdateAccount(String id, String account_num, int balance) {
		map.put("id", id);
		map.put("account_num", account_num);
		map.put("balance", balance);
		sqlSession.update("moneyio.balance_update_account", map);
	}
	
	//����/���� ���� �Է�
	public void insert(MoneyioDTO dto) {
//		System.out.println("id : " + dto.getId());

		sqlSession.insert("moneyio.insert", dto);
	}
	//��ġ���� �Է�
	public void n_insert(NbreadDTO ndto) {

		sqlSession.insert("moneyio.n_insert", ndto);
	}
	//����/���� ���� ���� ������
	public MoneyioDTO ioUpdateForm(int io_num) {

		return sqlSession.selectOne("moneyio.updateForm", io_num);
	}

	//����/���� ���� ����
	public void ioUpdatePro(MoneyioDTO dto) {
		sqlSession.update("moneyio.update", dto);
	}

	//����/���� ���� ����
	public void io_delete(int io_num) {
		sqlSession.delete("moneyio.io_delete", io_num);
	}
	
	//����/���� ���� ���� or �����ϱ� ���� ����
	public void n_delete(int io_num) {
		sqlSession.delete("moneyio.n_delete", io_num);
	}
	
	//��ġ���� ������ ���� ���Է�
	public void n_insert2(NbreadDTO ndto) {
		sqlSession.insert("moneyio.n_insert2", ndto);
	}
	//���ɴ뺰 ���� chart ������ -20
	public List<MoneyioDTO> ageChart20() {
		return sqlSession.selectList("moneyio.chart20");
	}
	
	//���ɴ뺰 ���� chart ������ -30
	public List<MoneyioDTO> ageChart30() {
		return sqlSession.selectList("moneyio.chart30");
	}
	
	//���ɴ뺰 ���� chart ������ -40
	public List<MoneyioDTO> ageChart40() {
		return sqlSession.selectList("moneyio.chart40");
	}
	
	public List<NbreadDTO> nList(int io_num){
		return sqlSession.selectList("moneyio.nList", io_num);
	}
	public String nSum(int io_num) {
		return sqlSession.selectOne("moneyio.nSum", io_num);
	}
	
	//���μҺ����� chart5��
	public List<MoneyioDTO> ptEstimate5(String id){
		return sqlSession.selectList("moneyio.ptEstimate5", id);
	}
	//���μҺ����� chart5�� �ѱݾ�
	public int sum5(String id) {
		return sqlSession.selectOne("moneyio.moneySum5", id);
	}
	//���μҺ����� chart6��
	public List<MoneyioDTO> ptEstimate6(String id){
		return sqlSession.selectList("moneyio.ptEstimate6", id);
	}
	//���μҺ����� chart6�� �ѱݾ�
	public int sum6(String id) {
		return sqlSession.selectOne("moneyio.moneySum6", id);
	}
	//���μҺ����� chart7��
	public List<MoneyioDTO> ptEstimate7(String id){
		return sqlSession.selectList("moneyio.ptEstimate7", id);
	}
	//���μҺ����� chart7�� �ѱݾ�
	public int sum7(String id) {
		return sqlSession.selectOne("moneyio.moneySum7", id);
	}
	
	public List<MoneyioDTO> nextMonth(String id){
		return sqlSession.selectList("moneyio.nextMonth", id);
	}	
	
	
	
	public List moneyioListAll(String id, String acc) {
		
		map.put("id", id);
		map.put("acc", acc);
		
		return sqlSession.selectList("moneyio.moneyioListAll", map);
	}
	public List moneyioListIn(String id, String acc) {
		
		map.put("id", id);
		map.put("acc", acc);
		
		return sqlSession.selectList("moneyio.moneyioListIn", map);
	}
	public List moneyioListOut(String id, String acc) {
		
		map.put("id", id);
		map.put("acc", acc);
		
		return sqlSession.selectList("moneyio.moneyioListOut", map);
	}
	
	public MoneyioDTO moneyioListDetail(String id, int ioNum) {
		
		map.put("id", id);
		map.put("ioNum", ioNum);
		
		return sqlSession.selectOne("moneyio.moneyioListDetail", map);
	}
	
	public List moneyioListRemain(String id) {
		
		return sqlSession.selectList("moneyio.moneyioListRemain", id);
	}
	
	public List myAccount(String id) {
		return sqlSession.selectList("moneyio.myAccount", id);
	}
	
	public int ioRemain(String id, String acc) {
			
		map.put("id", id);
		map.put("acc", acc);
		
		return sqlSession.selectOne("moneyio.ioRemain", map);
	}
	
	public int ioAllRemain(String id) {
		return sqlSession.selectOne("moneyio.ioAllRemain", id);
	}
	
	
}
