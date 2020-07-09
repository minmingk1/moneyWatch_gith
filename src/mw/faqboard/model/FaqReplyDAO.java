package mw.faqboard.model;

import org.mybatis.spring.SqlSessionTemplate;

public class FaqReplyDAO {
	
	//mybatis에 연결
	private SqlSessionTemplate sqlSession = null;
	
	//sqlSesson을 이용한 SQL 연결
	public FaqReplyDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
}
