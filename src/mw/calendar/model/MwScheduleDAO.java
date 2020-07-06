package mw.calendar.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import mw.moneyio.model.MoneyioDTO;

public class MwScheduleDAO {

	private SqlSessionTemplate sqlSession = null; //mybatis를 사용하기 위한 작업 - 연결
	
	// sql문을 사용하기 위함
	public MwScheduleDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 일정추가	
	public void schedule_insert(MwScheduleDTO mwdto) {
		
		sqlSession.insert("calendar.schedule_insert", mwdto);
	}
	
	// 일정출력	
	public List<MwScheduleDTO> schedule_select(String id) throws Exception {
		
		return sqlSession.selectList("calendar.schedule_select", id);
	}
	
	// 지출내역출력
	public List<MoneyioDTO> money_out(String id) throws Exception {
		
		return sqlSession.selectList("calendar.money_out", id);
	}
	
	// 수입내역출력
	public List<MoneyioDTO> money_in(String id) throws Exception {
		
		return sqlSession.selectList("calendar.money_in", id);
	}
	
	// 세부일정
	public MwScheduleDTO day_detail(String id, String title , String start_time ) {
		
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("title",title);
		map.put("start_time",start_time);
	
		return sqlSession.selectOne("calendar.day_detail",map);
	}
	
	// 세부지출내역
	public List out_detail(String id, String io_reg_date) {
		
		HashMap omap = new HashMap();
		omap.put("id",id);
		omap.put("io_reg_date",io_reg_date);
		
		return sqlSession.selectList("calendar.out_detail",omap);
	}
	
	// 세부수입내역
	public List in_detail(String id,String io_reg_date) {
		
		HashMap imap = new HashMap();
		imap.put("id",id);
		imap.put("io_reg_date",io_reg_date);
		
		return sqlSession.selectList("calendar.in_detail",imap);
	}
	
	// 일정삭제
	public void day_delete(String id, String title, String start_time) {
		
		HashMap dmap = new HashMap();
		dmap.put("id", id);
		dmap.put("title", title);
		dmap.put("start_time", start_time);
		
		sqlSession.delete("calendar.day_delete",dmap);
		
	}
	
	// 일정수정
	public void day_update(int num, MwScheduleDTO mwdto) {
		
		HashMap daymap = new HashMap();
		daymap.put("mwdto",mwdto);
		daymap.put("num",num);
		
		sqlSession.update("calendar.day_update",mwdto);
	}
}
