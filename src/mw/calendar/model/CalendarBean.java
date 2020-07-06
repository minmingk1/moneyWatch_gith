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
	
	List detail = new ArrayList();

	@RequestMapping("Calendar.mw")
	public String cal(HttpServletRequest request,MwScheduleDTO mwdto, Model model) throws Exception {
		
		// DB뿌려주기 필요
		String id = "tempid";
		List<MwScheduleDTO> slist = dao.schedule_select(id); // 일정가져오기
		List<MoneyioDTO> olist = dao.money_out("crong"); // 지출내역가져오기
		List<MoneyioDTO> ilist = dao.money_in("crong"); // 수입내역가져오기
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		
		return "/calendar/calendar";
	}

	
	@RequestMapping("day_popUp.mw") // 캘린더 팝업창
	public String cal_pop(Model model,String year,String month,String day) {
		
		String date = year + "-" + month + "-" + day;

		model.addAttribute("date",date);

		return "/calendar/day";
	}
	
	@RequestMapping("day_insert.mw") // 캘린더일정 데이터 입력
	public String cal_insert(MwScheduleDTO mwdto) {
		
		dao.schedule_insert(mwdto); // 캘린더 일정 DB입력

		return "/calendar/day";
	}
	
	
	// 일정세부내용
	@RequestMapping("day_detail.mw")
	public String day_detail(String title,String start_time, Model model) {

		
		/* String id = request.getSession("memId"); */
		String id = "tempid";
		
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		
		return "/calendar/day_detail";
	}
	
	// 세부지출내용
	@RequestMapping("out_detail.mw")
	public String out_detail(HttpServletRequest request, Model model) {
		
		List outlist = new ArrayList();
		
		/* String id = request.getSession("memId"); */
		String id = "crong";
		String io_reg_date = request.getParameter("start_time");
		
		outlist = dao.out_detail(id,io_reg_date);
		
		model.addAttribute("outlist",outlist);
		
		return "/calendar/out_detail";
	}
	
	// 세부수입내용
	@RequestMapping("in_detail.mw")
	public String in_detail(HttpServletRequest request, Model model) {
		
		List inlist = new ArrayList();
		
		/* String id = request.getSession("memId"); */
		String id = "crong";
		String io_reg_date = request.getParameter("start_time");
		
		inlist = dao.in_detail(id,io_reg_date);
		
		model.addAttribute("inlist",inlist);
		
		return "/calendar/in_detail";
	}
	
	//일정삭제
	@RequestMapping("day_delete.mw")
	public String day_delete(HttpServletRequest request){
	
		String id = "tempid";
		String title = request.getParameter("title");
		String start_time = request.getParameter("start_time");
		
		dao.day_delete(id, title, start_time);
		
		return "/calendar/day_delete";
	}
	
	//일정수정
	@RequestMapping("day_updateForm.mw")
	public String day_updateForm(String title, String start_time, Model model) {
		
		String id = "tempid";
		
		MwScheduleDTO detail = dao.day_detail(id, title , start_time);
		
		model.addAttribute("detail", detail);
		
		return "/calendar/day_updateForm";
	}
	
	@RequestMapping("day_updatePro.mw")
	public String day_updatePro(HttpServletRequest request, MwScheduleDTO mwdto) {
		
		int num = Integer.parseInt(request.getParameter("num"));
	
		
		dao.day_update(num,mwdto);
		
		return "/calendar/day_updatePro";
	}
}
