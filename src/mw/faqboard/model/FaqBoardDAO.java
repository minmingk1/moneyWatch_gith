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
		
		public List getArticles(int start, int end) { //게시판 유저게시판 페이지 처음과 끝 지정해서 List 출력데이터 객체에 담아서 리턴
			HashMap map=new HashMap();
			map.put("start",start);
			map.put("end",end);
			
			List articleList= sqlSession.selectList("faqboard.getArticles", map);
	
			return articleList;
		}
		
		public int getCount(FaqBoardDTO dto) { //DB의 글의 갯수 찾아서 리턴
			int count = sqlSession.selectOne("faqboard.getCount",dto);
			
			return count;
			
			
		}
		
		public FaqBoardDTO getContent(int num1) { //조회수 증가 SQL문과 DB게시글 데이터 객체에 담아서 리턴
			sqlSession.update("faqboard.upCount",num1);
			FaqBoardDTO article =sqlSession.selectOne("faqboard.getContent",num1); 
		   
			return article;
		}
		
		public int DeleteCheck(String faq_num,String pw) { //두개의 값을 기준으로 값 찾기
			HashMap map = new HashMap();
			map.put("faq_num",faq_num);
			map.put("pw",pw);
			
			int check=(int)sqlSession.selectOne("faqboard.DeleteCheck",map);
			
			return check;
		}
	
		public void DeleteWriting(String faq_num) { //게시글 삭제
			sqlSession.delete("faqboard.DeleteWriting",faq_num);
		}

		public FaqBoardDTO updateSelect(String faq_num) { //유저게시글 수정할 데이터 리턴
			FaqBoardDTO dto1=sqlSession.selectOne("faqboard.updateSelect", faq_num);
			
			return dto1;
		}
		
		public int updateCheck(String faq_num ,String pw) { //유저게시글 수정 전 데이터 검색하여 0또는 1로 리턴
			HashMap map = new HashMap();
			map.put("faq_num",faq_num);
			map.put("pw",pw);
			
			int check=sqlSession.selectOne("faqboard.updateCheck",map);
			
			return check;
		}
		
		
		public void updateContent(FaqBoardDTO dto) { //유저게시글 수정 된 데이터 SQL 삽입
			sqlSession.update("faqboard.updateContent",dto);
		}

		
		public void insertBoard(FaqBoardDTO dto) { //종솔
			sqlSession.insert("faqboard.insertBoard", dto);
		}
		
	
		public List selectMainFaq(FaqMainBoardDTO dto1) { //FAQ 게시글 객체에 담아 리턴
			List qList=sqlSession.selectList("faqboard.selectMainFaq",dto1);
		
			return qList;
		}
		
		public void insertQwrite(FaqMainBoardDTO dto) { //FAQ 글쓰기 데이터 SQL 삽입
			sqlSession.insert("faqboard.insertQwrite",dto);
		}
		
		public int getQcount(FaqMainBoardDTO dto1) { //FAQ 총 게시글 갯수를 리턴
			int qcount = sqlSession.selectOne("faqboard.getQcount",dto1);
			
			return qcount;
		}
		public FaqMainBoardDTO getQcontent(int qnum) { //FAQ 조회수 증가와 찾은 게시글 데이터 객체에 담아서 리턴
			sqlSession.update("faqboard.upQcount",qnum);
			FaqMainBoardDTO dto1= sqlSession.selectOne("faqboard.getQcontent", qnum);
			
			return dto1;
		}
		
		public void updateQcontnet(FaqMainBoardDTO dto) { //FAQ 수정할 데이터 SQL 삽입
			sqlSession.update("faqboard.updateQcontnet", dto);
		}
		
		public void DeleteQcontent(int qnum) { //FAQ 삭제할 데이터 SQL 삽입
			sqlSession.delete("faqboard.DeleteQcontent", qnum);
		}

		public int DeleteQcheck(int qnum,String q_id) { //FAQ 삭제할 데이터 두개의 값으로 찾아서 0또는 1로 리턴
			HashMap map = new HashMap();
			map.put("qnum",qnum);
			map.put("q_id",q_id);
			
			int check=sqlSession.selectOne("faqboard.DeleteQcheck",map);
			return check;
		}
		
		public List getArticles(int start, int end, String id) { //mylist 데이터 찾아 리턴
			HashMap map=new HashMap();
			map.put("start",start);
			map.put("end",end);
			map.put("id",id);
			
			System.out.println(start);
			System.out.println(end);
			System.out.println(id);
			
			List articleList= sqlSession.selectList("faqboard.mygetArticles", map);
			return articleList;
		}
		
		public int getCountmy(String id) { //mylist 에서 id로 찾아서 총 수량 객체에 담아서 리턴
			int count = (Integer)sqlSession.selectOne("faqboard.mylistboard",id);
			return count;
		}
}
		
		
	