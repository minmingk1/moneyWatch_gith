package mw.calendar.model;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import mw.moneyio.model.MoneyioDTO;

public class MwScheduleDAO {

	// SqlSessionTemplate�� �����忡 �����ϰ� �������� DAO�� mapper���� ������ �� ����
	private SqlSessionTemplate sqlSession = null; //mybatis�� ����ϱ� ���� �۾� - ����
	
	// sql���� ����ϱ� ����
	public MwScheduleDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// �����߰�	
	public void schedule_insert(MwScheduleDTO mwdto) {
		
		sqlSession.insert("calendar.schedule_insert", mwdto);
	}
	
	// �������	
	public List<MwScheduleDTO> schedule_select(String id) throws Exception {
		
		return sqlSession.selectList("calendar.schedule_select", id);
	}
	
	// ���⳻�����
	public List<MoneyioDTO> money_out(String id) throws Exception {
		
		return sqlSession.selectList("calendar.money_out", id);
	}
	
	// ���Գ������
	public List<MoneyioDTO> money_in(String id) throws Exception {
		
		return sqlSession.selectList("calendar.money_in", id);
	}
	
	// ��������
	public MwScheduleDTO day_detail(String id, String title , String start_time ) {
		
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("title",title);
		map.put("start_time",start_time);
	
		return sqlSession.selectOne("calendar.day_detail",map);
	}
	
	// �������⳻��
	public List out_detail(String id, String io_reg_date) {
		
		HashMap omap = new HashMap();
		omap.put("id",id);
		omap.put("io_reg_date",io_reg_date);
		
		return sqlSession.selectList("calendar.out_detail",omap);
	}
	
	// ���μ��Գ���
	public List in_detail(String id,String io_reg_date) {
		
		HashMap imap = new HashMap();
		imap.put("id",id);
		imap.put("io_reg_date",io_reg_date);
		
		return sqlSession.selectList("calendar.in_detail",imap);
	}
	
	// ��������
	public void day_delete(String id, String title, String start_time) {
		
		HashMap dmap = new HashMap();
		dmap.put("id", id);
		dmap.put("title", title);
		dmap.put("start_time", start_time);
		
		sqlSession.delete("calendar.day_delete",dmap);
		
	}
	
	// ��������
	public void day_update(int num, MwScheduleDTO mwdto) {
		
		HashMap daymap = new HashMap();
		daymap.put("mwdto",mwdto);
		daymap.put("num",num);
		
		sqlSession.update("calendar.day_update",mwdto);
	}
	
	// ���� ����(memo) ��������
	public String todayMemo(String id) {
		Calendar cal = Calendar.getInstance();
		//���� ����, ��, ��
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1;
		int day = cal.get ( cal.DATE );
		String month_s = month+"";
		String day_s = day+"";
		if(month<10) {
			month_s = "0"+month;
		}
		if(day<10) {
			day_s = "0"+day;
		}
		
		String today = year + "-" + month_s + "-" + day_s;
		
		HashMap map = new HashMap(); 
		map.put("id", id);
		map.put("today", today);
		
		return sqlSession.selectOne("calendar.todayMemo", map);
	}
}
