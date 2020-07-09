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

	@RequestMapping("Calendar.mw") // 캘린더 메인페이지
	public String cal(HttpSession session, HttpServletRequest request,MwScheduleDTO mwdto, Model model) throws Exception {
		
		String id = (String)session.getAttribute("memId");
		List<MwScheduleDTO> slist = dao.schedule_select(id); // 일정가져오기
		List<MoneyioDTO> olist = dao.money_out(id); // 지출내역가져오기
		List<MoneyioDTO> ilist = dao.money_in(id); // 수입내역가져오기
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		
		return "/calendar/calendar";
	}

	@RequestMapping("Calendar_sub.mw") // 캘린더 클릭시 들어가는 페이지
	public String cal_sub(HttpSession session, HttpServletRequest request,MwScheduleDTO mwdto, Model model) throws Exception {
		
		String id = (String)session.getAttribute("memId");
		List<MwScheduleDTO> slist = dao.schedule_select(id); // 일정가져오기
		List<MoneyioDTO> olist = dao.money_out(id); // 지출내역가져오기
		List<MoneyioDTO> ilist = dao.money_in(id); // 수입내역가져오기
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		
		return "/calendar/calendar_sub";
	}
	
	@RequestMapping("day_popUp.mw") // 캘린더 팝업창
	public String cal_pop(Model model,String year,String month,String day) {
		
		String date = year + "-" + month + "-" + day; // year-month-day로 합쳐진 형태로 저장시키기 위함

		model.addAttribute("date",date);

		return "/calendar/day";
	}
	
	@RequestMapping("day_insert.mw") // 캘린더일정 데이터 입력
	public String cal_insert(MwScheduleDTO mwdto) {
		
		dao.schedule_insert(mwdto); // 캘린더 일정 DB입력

		return "/calendar/day";
	}
	
	
	@RequestMapping("day_detail.mw")// 일정세부내용 출력
	public String day_detail(HttpSession session, String title, String start_time, Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		// title : 일정명 , start_time : 일정 시작일 
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		
		return "/calendar/day_detail";
	}
	
	@RequestMapping("out_detail.mw") // 세부지출내용
	public String out_detail(HttpSession session, HttpServletRequest request, Model model) {
		
		List outlist = new ArrayList();
		
		String id = (String)session.getAttribute("memId");
		String io_reg_date = request.getParameter("start_time"); // 지출일
		
		outlist = dao.out_detail(id,io_reg_date);
	
		model.addAttribute("outlist",outlist);
		
		return "/calendar/out_detail";
	}
	
	@RequestMapping("in_detail.mw")// 세부수입내용
	public String in_detail(HttpSession session, HttpServletRequest request, Model model) {
		
		List inlist = new ArrayList();
		
		String id = (String)session.getAttribute("memId");
		String io_reg_date = request.getParameter("start_time"); // 수입일
		
		inlist = dao.in_detail(id,io_reg_date);
		
		model.addAttribute("inlist",inlist);
		
		return "/calendar/in_detail";
	}
	
	@RequestMapping("day_delete.mw")//일정삭제
	public String day_delete(HttpSession session, HttpServletRequest request){
	
		String id = (String)session.getAttribute("memId");
		String title = request.getParameter("title"); // 일정명
		String start_time = request.getParameter("start_time"); // 시작일
		
		dao.day_delete(id, title, start_time);
		
		return "/calendar/day_delete";
	}
	
	@RequestMapping("day_updateForm.mw") //일정수정 form
	public String day_updateForm(HttpSession session, String title, String start_time, Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		
		return "/calendar/day_updateForm";
	}
	
	@RequestMapping("day_updatePro.mw")// 일정수정처리
	public String day_updatePro(HttpServletRequest request, MwScheduleDTO mwdto) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.day_update(num,mwdto);
		
		return "/calendar/day_updatePro";
	}
}
