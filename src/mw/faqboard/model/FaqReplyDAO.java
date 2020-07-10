package mw.faqboard.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public class FaqReplyDAO {
	
	//mybatis에 연결
	private SqlSessionTemplate sqlSession = null;
	
	//sqlSesson을 이용한 SQL 연결
	public FaqReplyDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//reply 입력
	public void faqContentReplyInsert(String id, int faq_num, String content) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("faq_num", faq_num);
		map.put("content", content);
		
		sqlSession.delete("reply.replyInsert", map);
	}
	
}
