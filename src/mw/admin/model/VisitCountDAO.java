package mw.admin.model;

import org.mybatis.spring.SqlSessionTemplate;

public class VisitCountDAO {
	
private SqlSessionTemplate sqlSession = null;
	
	public VisitCountDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertVisitor(VisitCountDTO dto) throws Exception{
        return sqlSession.insert("admin.insertVisitor", dto);
    }
}
