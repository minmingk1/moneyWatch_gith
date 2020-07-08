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

	int todayVisitorCount;		// 오늘 방문자 수
	int oneAgoVisitorCount;		// 1일 전 방문자 수
	int twoAgoVisitorCount;		// 2일 전 방문자 수
	int threeAgoVisitorCount;	// 3일 전 방문자 수
	int fourAgoVisitorCount;	// 4일 전 방문자 수
	int fiveAgoVisitorCount;	// 5일 전 방문자 수
	int sixAgoVisitorCount;		// 6일 전 방문자 수
	int sevenAgoVisitorCount;	// 7일 전 방문자 수
	int eightAgoVisitorCount;	// 8일 전 방문자 수
	int nineAgoVisitorCount;	// 9일 전 방문자 수
	int tenAgoVisitorCount;		// 10일 전 방문자 수
	int eleAgoVisitorCount;		// 11일 전 방문자 수
	
	int todayLeaveCount;		// 오늘 탈퇴회원 수
	int oneAgoLeaveCount;		// 1일 전 탈퇴회원 수
	int twoAgoLeaveCount;		// 2일 전 탈퇴회원 수
	int threeAgoLeaveCount;		// 3일 전 탈퇴회원 수
	int fourAgoLeaveCount;		// 4일 전 탈퇴회원 수
	int fiveAgoLeaveCount;		// 5일 전 탈퇴회원 수
	int sixAgoLeaveCount;		// 6일 전 탈퇴회원 수
	int sevenAgoLeaveCount;		// 7일 전 탈퇴회원 수
	int eightAgoLeaveCount;		// 8일 전 탈퇴회원 수
	int nineAgoLeaveCount;		// 9일 전 탈퇴회원 수
	int tenAgoLeaveCount;		// 10일 전 탈퇴회원 수
	int eleAgoLeaveCount;		// 11일 전 탈퇴회원 수
	
	int todayRegisterCount;		// 오늘 등록회원 수
	int oneAgoRegisterCount;	// 1일 전 등록회원 수
	int twoAgoRegisterCount;	// 2일 전 등록회원 수
	int threeAgoRegisterCount;	// 3일 전 등록회원 수
	int fourAgoRegisterCount;	// 4일 전 등록회원 수
	int fiveAgoRegisterCount;	// 5일 전 등록회원 수
	int sixAgoRegisterCount;	// 6일 전 등록회원 수
	int sevenAgoRegisterCount;	// 7일 전 등록회원 수
	int eightAgoRegisterCount;	// 8일 전 등록회원 수
	int nineAgoRegisterCount;	// 9일 전 등록회원 수
	int tenAgoRegisterCount;	// 10일 전 등록회원 수
	int eleAgoRegisterCount;	// 11일 전 등록회원 수
	

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
			
			if(i == 0)	{
				todayVisitorCount = admdao.visitorCount(daymap);
				todayLeaveCount = admdao.leaveCount(daymap);
				todayRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 1)	{
				oneAgoVisitorCount = admdao.visitorCount(daymap);
				oneAgoLeaveCount = admdao.leaveCount(daymap);
				oneAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 2)	{
				twoAgoVisitorCount = admdao.visitorCount(daymap);
				twoAgoLeaveCount = admdao.leaveCount(daymap);
				twoAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 3)	{
				threeAgoVisitorCount = admdao.visitorCount(daymap);
				threeAgoLeaveCount = admdao.leaveCount(daymap);
				threeAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 4)	{
				fourAgoVisitorCount = admdao.visitorCount(daymap);
				fourAgoLeaveCount = admdao.leaveCount(daymap);
				fourAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 5)	{
				fiveAgoVisitorCount = admdao.visitorCount(daymap);
				fiveAgoLeaveCount = admdao.leaveCount(daymap);
				fiveAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 6)	{
				sixAgoVisitorCount = admdao.visitorCount(daymap);
				sixAgoLeaveCount = admdao.leaveCount(daymap);
				sixAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 7)	{
				sevenAgoVisitorCount = admdao.visitorCount(daymap);
				sevenAgoLeaveCount = admdao.leaveCount(daymap);
				sevenAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 8)	{
				eightAgoVisitorCount = admdao.visitorCount(daymap);
				eightAgoLeaveCount = admdao.leaveCount(daymap);
				eightAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 9)	{
				nineAgoVisitorCount = admdao.visitorCount(daymap);
				nineAgoLeaveCount = admdao.leaveCount(daymap);
				nineAgoRegisterCount = admdao.registerCount(daymap);				
			}
			if(i == 10)	{
				tenAgoVisitorCount = admdao.visitorCount(daymap);
				tenAgoLeaveCount = admdao.leaveCount(daymap);
				tenAgoRegisterCount = admdao.registerCount(daymap);
			}
			if(i == 11)	{
				eleAgoVisitorCount = admdao.visitorCount(daymap);
				eleAgoLeaveCount = admdao.leaveCount(daymap);
				eleAgoRegisterCount = admdao.registerCount(daymap);
			}
			
		}
		
		 
		model.addAttribute("todayVisitorCount", todayVisitorCount);
		model.addAttribute("oneAgoVisitorCount", oneAgoVisitorCount);
		model.addAttribute("twoAgoVisitorCount", twoAgoVisitorCount);
		model.addAttribute("threeAgoVisitorCount", threeAgoVisitorCount);
		model.addAttribute("fourAgoVisitorCount", fourAgoVisitorCount);
		model.addAttribute("fiveAgoVisitorCount", fiveAgoVisitorCount);
		model.addAttribute("sixAgoVisitorCount", sixAgoVisitorCount);
		model.addAttribute("sevenAgoVisitorCount", sevenAgoVisitorCount);
		model.addAttribute("eightAgoVisitorCount", eightAgoVisitorCount);
		model.addAttribute("nineAgoVisitorCount", nineAgoVisitorCount);
		model.addAttribute("tenAgoVisitorCount", tenAgoVisitorCount);
		model.addAttribute("eleAgoVisitorCount", eleAgoVisitorCount);
		
		
//		System.out.println("0 : " + todayVisitorCount + ", 1 : " + oneAgoVisitorCount + ", 2 : " + twoAgoVisitorCount + 
//				", 3 : " + threeAgoVisitorCount + ", 4 : " + fourAgoVisitorCount + ", 5 : " + fiveAgoVisitorCount);
		
		//#####################################################################################################################
		//탈퇴 회원 수#####################################################################################################################
		
		model.addAttribute("todayLeaveCount", todayLeaveCount);
		model.addAttribute("oneAgoLeaveCount", oneAgoLeaveCount);
		model.addAttribute("twoAgoLeaveCount", twoAgoLeaveCount);
		model.addAttribute("threeAgoLeaveCount", threeAgoLeaveCount);
		model.addAttribute("fourAgoLeaveCount", fourAgoLeaveCount);
		model.addAttribute("fiveAgoLeaveCount", fiveAgoLeaveCount);
		model.addAttribute("sixAgoLeaveCount", sixAgoLeaveCount);
		model.addAttribute("sevenAgoLeaveCount", sevenAgoLeaveCount);
		model.addAttribute("eightAgoLeaveCount", eightAgoLeaveCount);
		model.addAttribute("nineAgoLeaveCount", nineAgoLeaveCount);
		model.addAttribute("tenAgoLeaveCount", tenAgoLeaveCount);
		model.addAttribute("eleAgoLeaveCount", eleAgoLeaveCount);
		
//		System.out.println("0 : " + todayLeaveCount + ", 1 : " + oneAgoLeaveCount + ", 2 : " + twoAgoLeaveCount + 
//		", 3 : " + threeAgoLeaveCount + ", 4 : " + fourAgoLeaveCount + ", 5 : " + fiveAgoLeaveCount);
		
		//#####################################################################################################################
		//등록 회원 수#####################################################################################################################
		
		model.addAttribute("todayRegisterCount", todayRegisterCount);
		model.addAttribute("oneAgoRegisterCount", oneAgoRegisterCount);
		model.addAttribute("twoAgoRegisterCount", twoAgoRegisterCount);
		model.addAttribute("threeAgoRegisterCount", threeAgoRegisterCount);
		model.addAttribute("fourAgoRegisterCount", fourAgoRegisterCount);
		model.addAttribute("fiveAgoRegisterCount", fiveAgoRegisterCount);
		model.addAttribute("sixAgoRegisterCount", sixAgoRegisterCount);
		model.addAttribute("sevenAgoRegisterCount", sevenAgoRegisterCount);
		model.addAttribute("eightAgoRegisterCount", eightAgoRegisterCount);
		model.addAttribute("nineAgoRegisterCount", nineAgoRegisterCount);
		model.addAttribute("tenAgoRegisterCount", tenAgoRegisterCount);
		model.addAttribute("eleAgoRegisterCount", eleAgoRegisterCount);
		
//		System.out.println("0 : " + todayRegisterCount + ", 1 : " + oneAgoRegisterCount + ", 2 : " + twoAgoRegisterCount + 
//				", 3 : " + threeAgoRegisterCount + ", 4 : " + fourAgoRegisterCount + ", 5 : " + fiveAgoRegisterCount);
		
		
		
		
		
		
		return "/admin/admin";
	}
	
	
}
