package mw.faqboard.model;

import org.mybatis.spring.SqlSessionTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import mw.faqboard.model.*;

public class FaqBoardDAO {

	private SqlSessionTemplate sqlSession = null;

	public FaqBoardDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List getArticles(int start, int end) {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List articleList = sqlSession.selectList("faqboard.getArticles", map);

		return articleList;
	}

	public int getCount(FaqBoardDTO dto) {
		int count = sqlSession.selectOne("faqboard.getCount", dto);

		return count;
	}

	public FaqBoardDTO getContent(int num1) {
		sqlSession.update("faqboard.upCount", num1);
		FaqBoardDTO article = sqlSession.selectOne("faqboard.getContent", num1);

		return article;
	}

	public int DeleteCheck(String faq_num, String pw) {
		HashMap map = new HashMap();
		map.put("faq_num", faq_num);
		map.put("pw", pw);

		int check = (int) sqlSession.selectOne("faqboard.DeleteCheck", map);

		return check;
	}

	public void DeleteWriting(String faq_num) {
		sqlSession.delete("faqboard.DeleteWriting", faq_num);
	}

	public FaqBoardDTO updateSelect(String faq_num) {
		FaqBoardDTO dto1 = sqlSession.selectOne("faqboard.updateSelect", faq_num);

		return dto1;
	}

	public int updateCheck(String faq_num, String pw) {
		HashMap map = new HashMap();
		map.put("faq_num", faq_num);
		map.put("pw", pw);

		int check = sqlSession.selectOne("faqboard.updateCheck", map);

		return check;
	}

	public void updateContent(FaqBoardDTO dto) {
		sqlSession.update("faqboard.updateContent", dto);
	}

	public void insertBoard(FaqBoardDTO dto) {
		sqlSession.insert("faqboard.insertBoard", dto);
	}

	public List selectMainFaq(FaqMainBoardDTO dto1) {
		List qList = sqlSession.selectList("faqboard.selectMainFaq", dto1);

		return qList;
	}

	public void insertQwrite(FaqMainBoardDTO dto) {
		sqlSession.insert("faqboard.insertQwrite", dto);
	}

	public int getQcount(FaqMainBoardDTO dto1) {
		int qcount = sqlSession.selectOne("faqboard.getQcount", dto1);

		return qcount;
	}

	public FaqMainBoardDTO getQcontent(int qnum) {
		sqlSession.update("faqboard.upQcount", qnum);
		FaqMainBoardDTO dto1 = sqlSession.selectOne("faqboard.getQcontent", qnum);

		return dto1;
	}

	public void updateQcontnet(FaqMainBoardDTO dto) {
		sqlSession.update("faqboard.updateQcontnet", dto);
	}

	public void DeleteQcontent(int qnum) {
		sqlSession.delete("faqboard.DeleteQcontent", qnum);
	}

	public int DeleteQcheck(int qnum, String q_id) {
		HashMap map = new HashMap();
		map.put("qnum", qnum);
		map.put("q_id", q_id);

		int check = sqlSession.selectOne("faqboard.DeleteQcheck", map);
		return check;
	}

	public List getArticles(int start, int end, String id) {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		System.out.println(start);
		System.out.println(end);
		System.out.println(id);

		List articleList = sqlSession.selectList("faqboard.mygetArticles", map);
		return articleList;
	}

	public int getCountmy(String id) {
		int count = (Integer) sqlSession.selectOne("faqboard.mylistboard", id);
		return count;
	}
}
