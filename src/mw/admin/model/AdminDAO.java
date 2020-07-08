package mw.admin.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAO {
	
private SqlSessionTemplate sqlSession = null;
	
	public AdminDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertVisitor(VisitCountDTO dto) throws Exception{
        return sqlSession.insert("admin.insertVisitor", dto);
    }
	
	public int visitorCount(HashMap map) {		
		return sqlSession.selectOne("admin.visitCount", map);
	}
	
	public int leaveCount(HashMap map) {
		return sqlSession.selectOne("admin.leaveCount", map);
	}
	
	public int registerCount(HashMap map) {
		return sqlSession.selectOne("admin.registerCount", map);
	}
	
}
