package mw.faqboard.model;

import org.mybatis.spring.SqlSessionTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import mw.faqboard.model.*;

public class FaqBoardDAO {

	private SqlSessionTemplate sqlSession = null;
	//SQL과 연결하기 위해 root 서블릿에서 호출
	public FaqBoardDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession; 
	}

	public List getArticles(int start, int end) {//유저게시판 list 출력 데이터
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List articleList = sqlSession.selectList("faqboard.getArticles", map);

		return articleList;
	}

	public int getCount(FaqBoardDTO dto) {//유저게시판 총 갯수
		int count = sqlSession.selectOne("faqboard.getCount", dto);

		return count;
	}

	public FaqBoardDTO getContent(int num1) { //조회수 증가와 함께 유저게시글 데이터 반환
		sqlSession.update("faqboard.upCount", num1);
		FaqBoardDTO article = sqlSession.selectOne("faqboard.getContent", num1);

		return article;
	}

	public int DeleteCheck(String faq_num, String pw) { //삭제 전 체크객체 반환
		HashMap map = new HashMap();
		map.put("faq_num", faq_num);
		map.put("pw", pw);

		int check = (int) sqlSession.selectOne("faqboard.DeleteCheck", map);

		return check;
	}

	public void DeleteWriting(String faq_num) {//유저 게시글 삭제 요청
		sqlSession.delete("faqboard.DeleteWriting", faq_num);
	}

	public FaqBoardDTO updateSelect(String faq_num) { //유저게시글 수정데이터 반환 
		FaqBoardDTO dto1 = sqlSession.selectOne("faqboard.updateSelect", faq_num);

		return dto1;
	}

	public int updateCheck(String faq_num, String pw) { //유저게시글 수정 전 체크객체로 반환
		//비교해야할 값이 2개 이상이여서 hashmap클래스 사용
		HashMap map = new HashMap();
		map.put("faq_num", faq_num);
		map.put("pw", pw);
		
		int check = sqlSession.selectOne("faqboard.updateCheck", map);

		return check;
	}

	public void updateContent(FaqBoardDTO dto) { //유저게시글 데이터 수정요청
		sqlSession.update("faqboard.updateContent", dto);
	}

	public void insertBoard(FaqBoardDTO dto) { //유저 게시글 글쓰기
		sqlSession.insert("faqboard.insertBoard", dto);
	}

	public List selectMainFaq(FaqMainBoardDTO dto1) {//운영자 게시글 list 데이터 반환
		List qList = sqlSession.selectList("faqboard.selectMainFaq", dto1);

		return qList;
	}

	public void insertQwrite(FaqMainBoardDTO dto) { //운영자 게시글 글쓰기
		sqlSession.insert("faqboard.insertQwrite", dto);
	}

	public int getQcount(FaqMainBoardDTO dto1) { //운영자게시글 총 갯수
		int qcount = sqlSession.selectOne("faqboard.getQcount", dto1);

		return qcount;
	}

	public FaqMainBoardDTO getQcontent(int qnum) { //조회수 증가와 운영자게시글 상세보기 반환
		sqlSession.update("faqboard.upQcount", qnum);
		FaqMainBoardDTO dto1 = sqlSession.selectOne("faqboard.getQcontent", qnum);

		return dto1;
	}

	public void updateQcontnet(FaqMainBoardDTO dto) { //운영자게시글 수정요청
		sqlSession.update("faqboard.updateQcontnet", dto);
	}

	public int DeleteQcheck(int qnum, String q_id) { //운영자게시글 삭제전 체크객체 반환
		HashMap map = new HashMap();
		map.put("qnum", qnum);
		map.put("q_id", q_id);

		int check = sqlSession.selectOne("faqboard.DeleteQcheck", map);
		return check;
	}
	
	public void DeleteQcontent(int qnum) { //운영자게시글 삭제요청
		sqlSession.delete("faqboard.DeleteQcontent", qnum);
	}

	public List getArticles(int start, int end, String id) { //내가쓴글 list 데이터 반환
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List articleList = sqlSession.selectList("faqboard.mygetArticles", map);
		return articleList;
	}

	public int getCountmy(String id) { //내가쓴글 갯수 카운트객체 반환
		int count = (Integer) sqlSession.selectOne("faqboard.mylistboard", id);
		return count;
	}
}
