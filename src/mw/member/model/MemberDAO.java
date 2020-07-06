package mw.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import java.util.List;

import mw.member.model.*;

public class MemberDAO {
	
	
	private SqlSessionTemplate sqlSession = null;
	
	public MemberDAO(SqlSessionTemplate sqlSession) {	// 생성자
		this.sqlSession = sqlSession;	// 생성자를 통해서 SqlSessionTemplate 가져오기(생성)		
	}
	
	public int loginCheck(MemberDTO dto) { //로그인 체크
		int check = (int)sqlSession.selectOne("member.loginCheck", dto);
		
		return check;
	}
	
	public void insert(MemberDTO dto) { //회원가입 데이터 삽입
		sqlSession.insert("member.insert", dto);
	}
	
	public int memberCheck(String id) { //회원 중복확인
		int check = sqlSession.selectOne("member.memberCheck", id);
		
		return check;
	}
	
	public MemberDTO modifyCheck(String id) { //회원 수정 데이터 리턴
		MemberDTO dto = (MemberDTO)sqlSession.selectOne("member.modifyCheck",id);
	    return dto;
	}
	
	public void updateMember(MemberDTO dto){ //회원 정보 수정 삽입
		sqlSession.update("member.updateMember", dto);
	}
	
	public int deleteCheck(String id,String pw) {  //회원 탈퇴 전 체크
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("pw",pw);
		
		int check = (int)sqlSession.selectOne("member.deleteCheck",map);
		return check;
	}
	
	public MemberDTO deleteSelect(String id) { //삭제할 회원정보 반환
		MemberDTO dto1=(MemberDTO)sqlSession.selectOne("member.deleteSelect", id);
		return dto1;
	}
	
	public void deleteInsert(DeleteMemListDTO dto2) { //회원DB에서 회원탈퇴List DB로 복사
		sqlSession.insert("member.deleteMemList", dto2);
	}
	
	public void deleteMem(String id) { //회원탈퇴 정보 삽입
		sqlSession.delete("member.deleteMem", id);
	
	}
	public List selectMemList(MemberDTO dto) { //회원 리스트
		List list=sqlSession.selectList("member.selectMemList",dto);
		
		
		
		return list;
	}
	public String memSearch(String keyWord,String keyField) {
		HashMap map= new HashMap();
		map.put("keyWord",keyWord);
		map.put("keyField",keyField);
		
		
		String search=sqlSession.selectOne("member.memSearch",map);
		return search;
	}
}