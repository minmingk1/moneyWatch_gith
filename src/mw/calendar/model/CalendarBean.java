package mw.calendar.model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.vertx.java.core.http.impl.HttpReadStreamBase;

import mw.moneyio.model.MoneyioDTO;

@Controller
public class CalendarBean {

	@Autowired
	private MwScheduleDAO dao = null;

	@RequestMapping("Calendar.mw") // Ķ���� ����������
	public String cal(HttpSession session, HttpServletRequest request,MwScheduleDTO mwdto, Model model) throws Exception {
		
		String id = (String)session.getAttribute("memId");
		int set = 0;
		
		List<MwScheduleDTO> slist = dao.schedule_select(id); // ������������
		List<MoneyioDTO> olist = dao.money_out(id); // ���⳻����������
		List<MoneyioDTO> ilist = dao.money_in(id); // ���Գ�����������
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		model.addAttribute("set",set); // ����Ķ�������� ����
		
		return "/calendar/calendar";
	}

	@RequestMapping("Calendar_sub.mw") // Ķ���� Ŭ���� ���� ������
	public String cal_sub(HttpSession session, HttpServletRequest request,MwScheduleDTO mwdto, Model model) throws Exception {
		
		String id = (String)session.getAttribute("memId");
		int set = 1;
		List<MwScheduleDTO> slist = dao.schedule_select(id); // ������������
		List<MoneyioDTO> olist = dao.money_out(id); // ���⳻����������
		List<MoneyioDTO> ilist = dao.money_in(id); // ���Գ�����������
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		model.addAttribute("set",set); // top�� �ִ� Ķ�������� ����
		
		return "/calendar/calendar_sub";
	}
	
	@RequestMapping("day_popUp.mw") // Ķ���� �˾�â
	public String cal_pop(Model model,String year,String month,String day) {
		
		String date = year + "-" + month + "-" + day; // year-month-day�� ������ ���·� �����Ű�� ����

		model.addAttribute("date",date);

		return "/calendar/day";
	}
	
	@RequestMapping("day_insert.mw") // Ķ�������� ������ �Է�
	public String cal_insert(MwScheduleDTO mwdto) {
		
		dao.schedule_insert(mwdto); // Ķ���� ���� DB�Է�

		return "/calendar/day";
	}
	
	
	@RequestMapping("day_detail.mw")// �������γ��� ���
	public String day_detail(HttpSession session, String title, String start_time, int set ,Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		// title : ������ , start_time : ���� ������ 
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		model.addAttribute("set", set);
		
		return "/calendar/day_detail";
	}
	
	@RequestMapping("out_detail.mw") // �������⳻��
	public String out_detail(HttpSession session, HttpServletRequest request, Model model) {
		
		List outlist = new ArrayList();
		
		String id = (String)session.getAttribute("memId");
		String io_reg_date = request.getParameter("start_time"); // ������
		
		outlist = dao.out_detail(id,io_reg_date);
	
		model.addAttribute("outlist",outlist);
		
		return "/calendar/out_detail";
	}
	
	@RequestMapping("in_detail.mw")// ���μ��Գ���
	public String in_detail(HttpSession session, HttpServletRequest request, Model model) {
		
		List inlist = new ArrayList();
		
		String id = (String)session.getAttribute("memId");
		String io_reg_date = request.getParameter("start_time"); // ������
		
		inlist = dao.in_detail(id,io_reg_date);
		
		model.addAttribute("inlist",inlist);
		
		return "/calendar/in_detail";
	}
	
	@RequestMapping("day_delete.mw")//��������
	public String day_delete(HttpSession session, HttpServletRequest request,Model model){
	
		String id = (String)session.getAttribute("memId");
		String title = request.getParameter("title"); // ������
		String start_time = request.getParameter("start_time"); // ������
		String set = request.getParameter("set");
		
		dao.day_delete(id, title, start_time);
		
		model.addAttribute("set",set);
		
		return "/calendar/day_delete";
	}
	
	@RequestMapping("day_updateForm.mw") //�������� form
	public String day_updateForm(HttpSession session, String title, String start_time, Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		
		return "/calendar/day_updateForm";
	}
	
	@RequestMapping("day_updatePro.mw")// ��������ó��
	public String day_updatePro(HttpServletRequest request, MwScheduleDTO mwdto) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.day_update(num,mwdto);
		
		return "/calendar/day_updatePro";
	}
}
