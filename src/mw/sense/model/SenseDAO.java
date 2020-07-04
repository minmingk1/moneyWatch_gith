package mw.sense.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SenseDAO {

	//mybatis에 연결
	private SqlSessionTemplate sqlSession = null; 	
	
	//sqlSession을 이용한 SQL에 연결
	public SenseDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인 비디오
	public SenseDTO mainVideo() {
		return sqlSession.selectOne("sense.mainVideo"); //
	}
	
	//메인 리스트
	public List<SenseDTO> mainList(){
		return sqlSession.selectList("sense.mainList"); //메인페이지에 리스트를 출력
	}
	
	//메인 카테고리 선택시 리스트
	public List<SenseDTO> mainCategorySelect(int num){
		return sqlSession.selectList("sense.categorySelect", num); //메인페이지 카테고리 선택시 리스트 출력
	}
	
	//디테일 메인 비디오
	public SenseDTO senseDetailVideo(int num) {
		SenseDTO dto = sqlSession.selectOne("sense.senseDetailVideo", num); //메인 리스트에서 선택시 비디오 url 변경
		return dto;
	}

	//마이스크랩 디테일 페이지
	public ScrapDTO senseDetail(int num, String id) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		ScrapDTO dto = sqlSession.selectOne("sense.myDetail", map);
		return dto; //디테일 페이지에 해당 정보를 보여줌
		
	}
	
	//조회수 올리기
	public void count(int num) {
		sqlSession.update("sense.count", num);
	} 
	
	//조회수 출력
	public int readcount(int num) {
		return sqlSession.selectOne("sense.readcount", num);		
	}
	
	//센스 입력 폼에 카테고리 셀렉트 리스트
	public List<SenseCategoryDTO> category() {
		return sqlSession.selectList("sense.category"); //카테고리로 선택해서 불러옴
	}
	
	//센스 직접 입력을 위한 senseMaxNum값 출력
	public int senseMaxNum() {
		return sqlSession.selectOne("sense.senseMaxNum"); //다음 num값으로 넣기 위해 MaxNum값 출력
	}
	
	//센스 직접 입력
	public void senseInsert(SenseDTO dto) {
		sqlSession.insert("sense.insert", dto); //데이터입력
	}
	
	//센스 입력 확인
	public int senseInsertCheck(SenseDTO dto) {
		int check = sqlSession.selectOne("sense.insertCheck", dto);
		return check;
	}
	
	// ID confirm	
	
	
	// PW confirm
	public int confirmPassword(String id, String password) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pw", password);
		int check = sqlSession.selectOne("sense.confirmPassword", map);
		
		return check;
	}
	
	// 센스 수정 페이지 불러오기
	public SenseDTO senseModifySelect(int num) {
		SenseDTO dto = (SenseDTO)sqlSession.selectOne("sense.select", num);
		return dto; //센스 수정 페이지에 해당 정보를 보여줌
	}
	
	//센스 입력 확인
	public int modifyCheck(SenseDTO dto) {
		int check = sqlSession.selectOne("sense.check", dto);
		return check;
	}
	
	// 센스 수정하기
	public void senseModify(SenseDTO dto) {
		sqlSession.update("sense.senseModify",dto);
	}
	
	// 센스 삭제
	public void senseDelete(int num) {
		sqlSession.delete("sense.senseDelete", num);
	}
	
	// 센스 삭제 확인
	public int senseDeleteCheck(int num) {
		int deleteCheck = sqlSession.selectOne("sense.senseDeleteCheck", num);
		return deleteCheck;
	}
	
	// 메모창에 제목 출력
	public SenseDTO senseMemo(int num) {
		return sqlSession.selectOne("sense.senseMemo",num);
	}
	
	// 스크랩 메인페이지
	public List<ScrapDTO> myScrap(String id) {
		return sqlSession.selectList("sense.myscrap", id);
	}
	
	// 스크랩 비디오
	public ScrapDTO myVideo(int num, String id) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		ScrapDTO video = (ScrapDTO)sqlSession.selectOne("sense.myVideo", map);
		return video;
	}
	
	//정보가져오기
	public SenseDTO senseSearch(int num) {
		SenseDTO dto = sqlSession.selectOne("sense.select", num);
		return dto; //디테일 페이지에 해당 정보를 보여줌
	}
	
	// 스크랩 저장
	public void scrap(int num, String id, String memo) {
		
		SenseDTO dto = (SenseDTO)senseSearch(num); //번호로 검색해 넣을 값을 불러옴
		HashMap map = new HashMap();
		map.put("scrap", dto);
		map.put("id", id);
		map.put("memo", memo);
		
		sqlSession.insert("sense.scrap", map);
	}
	
	// 스크랩 카테고리 선택시 리스트
	public List<ScrapDTO> myscrapCategory(String id, int num){
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		return sqlSession.selectList("sense.myscrapCategory", map); //메인페이지 카테고리 선택시 리스트 출력
		
	}
	
	// 스크랩 삭제
	public void scrapDelete(int num, String id) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		sqlSession.delete("sense.scrapDelete", map);
		
	}
	
}
