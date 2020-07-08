package mw.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import java.util.List;

import mw.member.model.*;

public class MemberDAO {

	private SqlSessionTemplate sqlSession = null;

	public MemberDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int loginCheck(MemberDTO dto) { // 로그인시 계정이 DB에 있는지 체크하는 메서드
		int check = (int) sqlSession.selectOne("member.loginCheck", dto);

		return check;
	}

	public void insert(MemberDTO dto) { // 회원가입시에 정보를 넣는 메서드
		sqlSession.insert("member.insert", dto);
	}

	public int memberCheck(String id) { // 회원가입시에 아이디가 중복되는지 체크하는 메서드
		int check = sqlSession.selectOne("member.memberCheck", id);

		return check;
	}

	public MemberDTO modifyCheck(String id) { // 서버에 올려져있는 세션아이디값을 dto에 저장하는메서드
		MemberDTO dto = (MemberDTO) sqlSession.selectOne("member.modifyCheck", id);
		return dto; // 그저장된 dto값을 리턴
	}

	public void updateMember(MemberDTO dto) { // 회원정보 수정한값을 DB에 업데이트 시켜주는 메서드
		sqlSession.update("member.updateMember", dto);
	}

	public int deleteCheck(String id, String pw) { // 회원 탈퇴진행전 id와 비번이 맞는지 확인하는 메서드
		HashMap map = new HashMap(); // 겍체 생성
		map.put("id", id); // map를 통해 id,pw 2개를 보넴
		map.put("pw", pw);

		int check = (int) sqlSession.selectOne("member.deleteCheck", map);//map에 id,pw을 체크
		return check; // 체크한값을 리턴
	}

	public MemberDTO deleteSelect(String id) { // id의 정보를 검색하는 메서드 그 정보를 dto1에 저장
		MemberDTO dto1 = (MemberDTO) sqlSession.selectOne("member.deleteSelect", id);
		return dto1;
	}

	public void deleteInsert(DeleteMemListDTO dto2) { // 탈퇴한 회원 의 정보를 DB에 넣는 메서드
		sqlSession.insert("member.deleteMemList", dto2);
	}

	public void deleteMem(String id) { // 회원 id에 대한 정보를 삭제를 진행하는 메서드
		sqlSession.delete("member.deleteMem", id);

	}

	public List selectMemList(MemberDTO dto) { // 관리자 회원 리스트
		List list = sqlSession.selectList("member.selectMemList", dto);

		return list;
	}

	public List memSearch(String keyField, String keyWord) { // 회원을 검색하는 메서드

		HashMap map = new HashMap();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);

		List search = sqlSession.selectList("member.memSearch", map);

		return search;
	}
}
