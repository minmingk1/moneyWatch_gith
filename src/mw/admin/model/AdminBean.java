package mw.admin.model;

import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.moneyio.model.MoneyioDAO;

@Controller
public class AdminBean {

	@Autowired
	private AdminDAO admdao = null;
	
	Calendar cal = Calendar.getInstance();
	//현재 년도, 월, 일
	int year = cal.get ( cal.YEAR );
	int month = cal.get ( cal.MONTH ) + 1;
	int day = cal.get ( cal.DATE );

	
	// index 0 : 오늘, 1 : 1일 전, 2 : 2일 전, ...
	int visitorCount[] = new int[12];	// 방문자 수
	
	int leaveCount[] = new int[12];		// 탈퇴 회원 수
	
	int registerCount[] = new int[12];	// 등록회원 수
	
	int moneyioCount[] = new int[12];	// 내역 등록 수

	@RequestMapping("admin.mw")
	public String admin(Model model) {
		String id = "admin";
		
		model.addAttribute("id", id);
		
		
		// 방문자 Count #####################################################################################################################
		//System.out.println("Today is " + year+ "-" + month + "-" + day);
		// 오늘 방문자 Count
		HashMap daymap = new HashMap();
		String days[] = new String[13];
		
		//todayVisitorCount = vcdao.visitorCount(year+ "-" + month + "-" + day);
		
		for(int i = 0; i < 13; i++ ) {			
		
			if((day == 28 && month == 2) || 
					day == 30 && (month == 4 || month == 6 || month == 9 || month == 11) || 
					day == 31 && (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)) {
				if(month == 12) {
					days[0] = (year+1) + "-1-1";
				}else {
					days[0] = year + "-" + (month+1) + "-1";
				}
			}else if(month == 2 || month == 4 || month == 6 || month == 8 || month == 9 || month == 11) {
				if(day <= (i-1)) {
					days[i] = year + "-" + (month-1) + "-" + (39-i);	
				}else {
					days[i] = year + "-" + month + "-" + (day+1-i);
				}
			}else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 10 || month == 12) {
				if(day <= (i-1)) {
					if(month == 1) {
						days[i] = (year-1) + "-" + "-12-31";
					}else if(month == 3) {
						days[i] = (year-1) + "-2-28";
					}else {
						days[i] = year + "-" + (month-1) +"-"+ (38-i);
					}
				}else {
					days[i] = year + "-" + month + "-" + (day+1-i);
				}
			} 
		
		//	System.out.println("days["+i+"] = " + days[i]);			
		}
		
		for(int i = 0; i < 12; i++) {
			daymap.put("day1",days[i]);
			daymap.put("day2",days[i+1]);
			
			
			
			visitorCount[i] = admdao.visitorCount(daymap);
			leaveCount[i] = admdao.leaveCount(daymap);
			registerCount[i] = admdao.registerCount(daymap);
			moneyioCount[i] = admdao.moneyioCount(daymap);	
			
			model.addAttribute("days"+i, days[i]);	// 오늘날짜(0), 어제날짜(1), .....
			model.addAttribute("visitorCount"+i, visitorCount[i]);	// 오늘(0),어제(1),... 방문자 수
			model.addAttribute("leaveCount"+i, leaveCount[i]);	// 오늘(0),어제(1),... 탈퇴회원 수
			model.addAttribute("registerCount"+i, registerCount[i]);	// 오늘(0),어제(1),... 등록자 수
			model.addAttribute("moneyioCount"+i, moneyioCount[i]);	// 오늘(0),어제(1),... 내역등록 수
		}
		
		
		
		
		
		
		return "/admin/admin";
	}
	
	
}
