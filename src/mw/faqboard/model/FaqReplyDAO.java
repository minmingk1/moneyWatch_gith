package mw.faqboard.model;

import java.util.HashMap;
import java.util.List;

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
		
		sqlSession.insert("reply.replyInsert", map);
	}
	
	//reply 리스트출력
	public List<FaqReplyDTO> faqContentReplyList(int faq_num){
		return sqlSession.selectList("reply.reply",faq_num);
	}
	
	//reply 개수
	public List<FaqReplyDTO> faqContentReplyCount() {
		return sqlSession.selectList("reply.replyCount");
	}
	
	//reply 삭제
	public void faqContentReplyDelete(String id, int num) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		sqlSession.delete("reply.replyDelete", map);
	}
	
	
	
}
