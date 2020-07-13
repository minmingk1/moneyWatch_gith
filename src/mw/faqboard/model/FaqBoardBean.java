package mw.faqboard.model;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.faqboard.model.FaqBoardDAO;
import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import java.lang.Integer;

@Controller
public class FaqBoardBean {
	
	@Autowired
	private FaqBoardDAO dao = null;
	
	//��� DAO
	@Autowired
	private FaqReplyDAO reply = null; 

	// FAQ �Խ���,�����Խ��� ���
	@RequestMapping("faqList.mw")
	public String faq_getArticles(FaqBoardDTO dto, FaqMainBoardDTO dto1, HttpSession session,
			HttpServletRequest respons, HttpServletRequest request, Model model) {
		List qList = null;

		qList = dao.selectMainFaq(dto1);
		int qcount = dao.getQcount(dto1);
		List<FaqReplyDTO> replycount = reply.faqContentReplyCount(); //��۰���

		if (qcount > 0) {
			model.addAttribute("qList", qList);
			model.addAttribute("qcount", qcount);
			model.addAttribute("replycount", replycount);
		}

		int pageSize = 10;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		session.getAttribute("memId");
		// ������ �� ����
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		} // ������ ���۰� �� ��ü ����
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;
		int number = 0;

		List articleList = null;

		int count = dao.getCount(dto);//��ü�Խñ� ���� ��������

		if (count > 0) {
			articleList = dao.getArticles(start, end);//SQL ���� ������������ ������ ã�� �޼���
		}

		number = count - (currentPage - 1) * pageSize; //�ʱⰪ 0 ���� �����Ͽ� ��ü�۰������� ������

		if (count > 0) { //��ü�� ������ 1���̻��϶� ����
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);// (/)�� ����� ���°� + (%)�� ������ ���� �� 0�� ���´ٸ� Ʈ�� �׿��� ���̳��´ٸ� 1
			int startPage = (int) (currentPage / 10) * 10 + 1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
			}
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("number", number);
			model.addAttribute("count", count);
			model.addAttribute("articleList", articleList);
		return "/faqboard/faqList";
	}

	
	@RequestMapping("faqDeleteForm.mw") // ���� �Խ��� ����
	public String faqDeleteForm(HttpServletRequest respons, ServletRequest request, Model model) {
		String pageNum = request.getParameter("pageNum"); 
		String faq_num = request.getParameter("faq_num");

		model.addAttribute("pageNum", pageNum); //��Ҹ� �������ÿ� ���ư����ְ� ��������ȣ�� ����
		model.addAttribute("faq_num", faq_num);

		return "/faqboard/faqDeleteForm";
	}

	@RequestMapping("faqDeletePro.mw") // �����Խ��� ���� ����
	public String faqDeletePro(HttpServletRequest respons, ServletRequest request, Model model) {
		String faq_num = request.getParameter("faq_num");
		String pw = request.getParameter("pw");

		int check = dao.DeleteCheck(faq_num, pw); //�Խñ۹�ȣ�� ��й�ȣ�� ��ġ�ϸ� ���� ����

		model.addAttribute("check", check);
		model.addAttribute("faq_num", faq_num);
		model.addAttribute("pw", pw);

		if (check == 1) {
			dao.DeleteWriting(faq_num);
		}
		return "/faqboard/faqDeletePro";
	}
	@RequestMapping("faqAdminDelForm.mw") // ������ �Խñ� ����
	public String faqAdminDelForm(Model model,ServletRequest request) {
		String faq_num =request.getParameter("faq_num");
		model.addAttribute("faq_num", faq_num);
		
		return "/faqboard/faqAdminDelForm";
	}
	
	@RequestMapping("faqAdminDel.mw") // ������ �Խñ� ���� ����
	public String faqAdminDel(Model model,HttpSession session,ServletRequest request) {
		int faq_num =Integer.parseInt(request.getParameter("faq_num"));
		String id=request.getParameter("memId");
		
			dao.DeleteAdminfaq(faq_num); //�Խñ� ��ȣ�� ã�Ƽ� ����
		
		
		return "/faqboard/faqAdminDel";
	}
	
	
	@RequestMapping("faqUpdateForm.mw") // �����Խ��� ����
	public String faqUpdateForm(FaqBoardDTO dto, HttpSession session, ServletRequest request, Model model) {
		String faq_num = request.getParameter("faq_num");
		String pageNum = request.getParameter("pageNum");

		FaqBoardDTO dto1 = dao.updateSelect(faq_num);//dto ��ü���� get ����� ���� DTO�� ���Ϲ���

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("faq_num", faq_num);
		model.addAttribute("dto1", dto1);

		return "/faqboard/faqUpdateForm";
	}

	@RequestMapping("faqUpdatePro.mw") // �����Խ��� ��������
	public String faqUpdatePro(FaqBoardDTO dto1, ServletRequest request, Model model, String article) {
		String faq_num = request.getParameter("faq_num");
		String pw = request.getParameter("pw");
		
		int check = dao.updateCheck(faq_num, pw);// 2���� ��ü�� ���Ͽ� üũ��ü�� ���Ϲ���

		model.addAttribute("check", check);
		model.addAttribute("faq_num", faq_num);
		model.addAttribute("pw", pw);

		if (check == 1) { //check �� ���� int���� ���ǰ� ��ġ�Ѵٸ� ����
			dao.updateContent(dto1);
		}

		return "/faqboard/faqUpdatePro";
	}

	@RequestMapping("faqWriteForm.mw") // �����Խ��� �۾���
	public String faqWriteForm(Model model, FaqBoardDTO dto, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		int faq_num = 0, readcount = 0;

		model.addAttribute("faq_num", faq_num);
		model.addAttribute("readcount", readcount);

		return "/faqboard/faqWriteForm";
	}

	@RequestMapping("faqWritePro.mw") // �����Խ��� �۾��� ����
	public String faqWritePro(FaqBoardDTO dto, HttpSession session) {

		String id = (String) session.getAttribute("memId");
		dto.setId(id);

		dao.insertBoard(dto);
		return "/faqboard/faqWritePro";
	}

	@RequestMapping("myList.mw") // ���� ���� ����
	public String myList(HttpSession session, HttpServletRequest respons, HttpServletRequest request, Model model) {

		int pageSize = 10;

		String pageNum = request.getParameter("pageNum");
		String id = (String) session.getAttribute("memId");

		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		int number = 0;

		List articleList = null;

		int count = dao.getCountmy(id);
		if (count > 0) {
			articleList = dao.getArticles(start, end, id);
		}
		number = count - (currentPage - 1) * pageSize;

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int) (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		request.setAttribute("memId", id);
		request.setAttribute("count", count);
		request.setAttribute("articleList", articleList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("number", number);

		return "/faqboard/myList";
	}

	// �������������� �� ���� �� ��
	@RequestMapping("myList_sub.mw") // ���� ���� ����
	public String myList_sub(HttpSession session, HttpServletRequest respons, HttpServletRequest request, Model model) {

		int pageSize = 10;

		String pageNum = request.getParameter("pageNum");
		String id = (String) session.getAttribute("memId");

		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		int number = 0;

		List articleList = null;

		int count = dao.getCountmy(id);
		if (count > 0) {
			articleList = dao.getArticles(start, end, id);
		}
		number = count - (currentPage - 1) * pageSize;

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int) (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		request.setAttribute("memId", id);
		request.setAttribute("count", count);
		request.setAttribute("articleList", articleList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("number", number);

		return "/faqboard/myList_sub";
	}
	
	@RequestMapping("content.mw") // �����Խñ� �� ����
	public String faqContent(FaqBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {
		String pageNum = request.getParameter("pageNum");
		String number = request.getParameter("number");

		String num = request.getParameter("faq_num");
		int num1 = Integer.parseInt(num);
		
		FaqBoardDTO article = dao.getContent(num1);
		List<FaqReplyDTO> replyList = reply.faqContentReplyList(num1); //������

		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("faq_num", num);

		model.addAttribute("article", article);
		model.addAttribute("reply", replyList);

		return "/faqboard/content";
	}
	
	@RequestMapping("content_sub.mw") // �����Խñ� �� ����_sub
	public String faqContent_sub(FaqBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {
		String pageNum = request.getParameter("pageNum");
		String number = request.getParameter("number");

		String num = request.getParameter("faq_num");
		int num1 = Integer.parseInt(num);
		
		FaqBoardDTO article = dao.getContent(num1);
		List<FaqReplyDTO> replyList = reply.faqContentReplyList(num1); //������

		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("faq_num", num);

		model.addAttribute("article", article);
		model.addAttribute("reply", replyList);

		return "/faqboard/content_sub";
	}
	
	//�����Խñ� �󼼺��� ��� ����� - ajax
	@RequestMapping("contentReply.mw")
	public String faqContentReply(int faq_num, String content, HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("memId");
		
		reply.faqContentReplyInsert(id, faq_num, content); // ��� �Է�
		List<FaqReplyDTO> replyList = reply.faqContentReplyList(faq_num);// ���
		
		model.addAttribute("faq_num", faq_num);
		model.addAttribute("reply", replyList);
		return "/faqboard/faqContentReply";
		
	}
	
	//�����Խñ� �󼼺��� ��� ���� - ajax
	@RequestMapping("contentReplyDelete.mw")
	public String faqContentReplyDelete(int num, int faq_num, HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("memId");
		reply.faqContentReplyDelete(id, num); // ��� ����
		List<FaqReplyDTO> replyList = reply.faqContentReplyList(faq_num);// ���

		model.addAttribute("reply", replyList);
		return "/faqboard/faqContentReply";
		
	}
	
	

	@RequestMapping("faqQwriteForm.mw") // ��� �Խñ� �ۼ�
	public String faqQwriteForm(FaqMainBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {

		int qnum = 0, qreadcount = 1;
		model.addAttribute("qnum", qnum);
		model.addAttribute("qreadcount", qreadcount);

		return "/faqboard/faqQwriteForm";
	}

	@RequestMapping("faqQwritePro.mw") // ��� �Խñ��ۼ� ����
	public String faqQwritePro(FaqMainBoardDTO dto) {
		dao.insertQwrite(dto);

		return "/faqboard/faqQwritePro";
	}

	@RequestMapping("faqContent.mw") // ��� �Խñ� �󼼺���
	public String faqMainContent(FaqMainBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {
		session.getAttribute("memId");

		int qnum = Integer.parseInt(request.getParameter("qnum"));

		FaqMainBoardDTO dto1 = dao.getQcontent(qnum);

		model.addAttribute("qlist", dto1);

		return "/faqboard/faqContent";
	}

	@RequestMapping("faqMainUpdateForm.mw") // ��� �Խñ� ����
	public String faqMainUpdateForm(FaqMainBoardDTO dto1, HttpServletRequest request, Model model,
			HttpSession session) {

		String id = (String) session.getAttribute("memId");
		String q_id = (String) request.getParameter("q_id");
		int qnum = (Integer.parseInt(request.getParameter("qnum")));
		//dto�� ���� ����
		FaqMainBoardDTO list = dao.getQcontent(qnum);

		model.addAttribute("memId", id);
		model.addAttribute("q_id", q_id);
		model.addAttribute("list", list); //dto�� ��ü �Ѱ��ֱ�

		return "/faqboard/faqMainUpdateForm";
	}

	@RequestMapping("faqMainUpdatePro.mw") // ��� �Խñ� ���� ����
	public String faqMainUpdatePro(FaqMainBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {

		dao.updateQcontnet(dto);

		return "/faqboard/faqMainUpdatePro";
	}

	@RequestMapping("faqMainDelete.mw") // ��� �Խñ� ����
	public String faqMainDelete(FaqMainBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {
		int qnum = (Integer.parseInt(request.getParameter("qnum")));
		String q_id = (String) session.getAttribute("memId");

		model.addAttribute("qnum", qnum);
		model.addAttribute("q_id", q_id);

		return "/faqboard/faqMainDelete";
	}

	@RequestMapping("faqMainDeletePro.mw") //��� �Խñ� ���� ����
	public String faqMainDeletePro(FaqMainBoardDTO dto, HttpServletRequest request, Model model, HttpSession session) {

		int qnum = (Integer.parseInt(request.getParameter("qnum")));
		String q_id = (String) session.getAttribute("memId");
		//üũ�� ���� ����
		int check = dao.DeleteQcheck(qnum, q_id);
		model.addAttribute("check", check);

		if (check == 1) {
			dao.DeleteQcontent(qnum);
		}
		return "/faqboard/faqMainDeletePro";
	}
}