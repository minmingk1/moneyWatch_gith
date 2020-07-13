package mw.faqboard.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FaqReplyDAO {
	
	//mybatis�� ����
	private SqlSessionTemplate sqlSession = null;
	
	//sqlSesson�� �̿��� SQL ����
	public FaqReplyDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//reply �Է�
	public void faqContentReplyInsert(String id, int faq_num, String content) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("faq_num", faq_num);
		map.put("content", content);
		
		sqlSession.insert("reply.replyInsert", map);
	}
	
	//reply ����Ʈ���
	public List<FaqReplyDTO> faqContentReplyList(int faq_num){
		
		return sqlSession.selectList("reply.reply",faq_num);
	}
	
	//reply ����
	public List<FaqReplyDTO> faqContentReplyCount() {
		
		List<FaqReplyDTO> dto = sqlSession.selectList("reply.replyCount");

		return dto;
	}
	
	//reply ����
	public void faqContentReplyDelete(String id, int num) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		sqlSession.delete("reply.replyDelete", map);
	}
	
	
	
}
