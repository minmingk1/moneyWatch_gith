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

	public int loginCheck(MemberDTO dto) {
		int check = (int) sqlSession.selectOne("member.loginCheck", dto);

		return check;
	}

	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}

	public int memberCheck(String id) {
		int check = sqlSession.selectOne("member.memberCheck", id);

		return check;
	}

	public MemberDTO modifyCheck(String id) {
		MemberDTO dto = (MemberDTO) sqlSession.selectOne("member.modifyCheck", id);
		return dto;
	}

	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
	}

	public int deleteCheck(String id, String pw) {
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pw", pw);

		int check = (int) sqlSession.selectOne("member.deleteCheck", map);
		return check;
	}

	public MemberDTO deleteSelect(String id) {
		MemberDTO dto1 = (MemberDTO) sqlSession.selectOne("member.deleteSelect", id);
		return dto1;
	}

	public void deleteInsert(DeleteMemListDTO dto2) {
		sqlSession.insert("member.deleteMemList", dto2);
	}

	public void deleteMem(String id) {
		sqlSession.delete("member.deleteMem", id);

	}

	public List selectMemList(MemberDTO dto) {
		List list = sqlSession.selectList("member.selectMemList", dto);

		return list;
	}

	public List memSearch(String keyField, String keyWord) {

		HashMap map = new HashMap();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);

		List search = sqlSession.selectList("member.memSearch", map);

		return search;
	}
}
