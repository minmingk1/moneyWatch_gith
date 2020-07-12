package mw.admin.model;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.faqboard.model.FaqBoardDTO;
import mw.member.model.MemberDTO;
import mw.moneyio.model.MoneyioDAO;
import mw.sense.model.SenseCategoryDTO;

@Controller
public class AdminBean {

	@Autowired
	private AdminDAO admdao = null;	// DAO객체 가져오기	
	String id;	// 로그인 세션 정보 저장할 변수 선언
	
	Calendar cal = Calendar.getInstance();
	//현재 연도, 월, 일
	int year = cal.get ( cal.YEAR );
	int month = cal.get ( cal.MONTH ) + 1;
	int day = cal.get ( cal.DATE );
	
	// index0(오늘의) ~ index11(12일 전의)
	int visitorCount[] = new int[12];	// 방문자 수	
	int leaveCount[] = new int[12];		// 탈퇴 회원 수	
	int registerCount[] = new int[12];	// 등록회원 수	
	int moneyioCount[] = new int[12];	// 내역 등록 수
	// 내일 날짜 ~ 12일 전의 날짜 저장 배열 선언 (index0~12)
	String days[] = new String[13];		
	HashMap<String, String> daymap = new HashMap<String, String>();
										// 날짜 2개씩 저장할 Map 선언	

	@RequestMapping("admin.mw")
	public String admin(Model model, HttpSession session) {
		
		// 로그인ID정보 저장
		id = (String)session.getAttribute("memId");		
		model.addAttribute("id", id);
		
		// 날짜 계산 및 저장 (내일~12일 전날의)
		for(int i = 0; i < 13; i++ ) {	
				if((day == 28 && month == 2) || 
					day == 30 && (month == 4 || month == 6 || month == 9 || month == 11) || 
					day == 31 && (month == 1 || month == 3 || month == 5 || month == 7 || 
								month == 8 || month == 10 || month == 12))	{
				// 내일이 다음 달 1일일 경우
							if(month == 12) {
									days[0] = (year+1) + "-1-1";
							}else {
									days[0] = year + "-" + (month+1) + "-1";
							}
				}else if(month == 2 || month == 4 || month == 6 || month == 8 || month == 9 || month == 11) {
				// 1일 씩 감소 (1일 전이 31일 경우 포함)
						if(day <= (i-1)) {
								days[i] = year + "-" + (month-1) + "-" + (day+32-i);	
						}else {
								days[i] = year + "-" + month + "-" + (day+1-i);
						}
				}else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 10 || month == 12) {
				// 1일씩 감소 (1일 전이 30일 경우, 2월 28일, 작년 12월 31일 경우 포함)
						if(day <= (i-1)) {
								if(month == 1) {
										days[i] = (year-1) + "-" + "-12-31";
								}else if(month == 3) {
										days[i] = (year-1) + "-2-28";
								}else {
										days[i] = year + "-" + (month-1) +"-"+ (day+31-i);
								}
						}else {
								days[i] = year + "-" + month + "-" + (day+1-i);
						}
				} 
			
		}
		
		// 계산한 날짜 배열을(days) Map에 저장 후 DAO호출 수행
		for(int i = 0; i < 12; i++) {
				daymap.put("day1",days[i]);
				daymap.put("day2",days[i+1]);
				
				visitorCount[i] = admdao.visitorCount(daymap); // 일자별 방문자 수
				leaveCount[i] = admdao.leaveCount(daymap);		// 일자별 탈퇴회원 수
				registerCount[i] = admdao.registerCount(daymap);	// 일자별 등록회원 수
				moneyioCount[i] = admdao.moneyioCount(daymap);		// 일자별 내역등록 건수
				
				model.addAttribute("days"+i, days[i]);	// 오늘날짜(0), 어제날짜(1), .....
				model.addAttribute("visitorCount"+i, visitorCount[i]);	// 오늘(0),어제(1),... 방문자 수
				model.addAttribute("leaveCount"+i, leaveCount[i]);	// 오늘(0),어제(1),... 탈퇴회원 수
				model.addAttribute("registerCount"+i, registerCount[i]);	// 오늘(0),어제(1),... 등록자 수
				model.addAttribute("moneyioCount"+i, moneyioCount[i]);	// 오늘(0),어제(1),... 내역등록 수			
		}

		
		// FAQ Board - 최근 등록된 게시글 (최대 5개)
		List<FaqBoardDTO> faqList = admdao.faqboardinfo();
		model.addAttribute("faqList", faqList);
		
		// Sense Category Count - 금융지식 카테고리 별 스크랩 수
		List<SenseCategoryDTO> senseCount = admdao.senseCount();
		model.addAttribute("senseCount", senseCount);		
		
		// Member Age Count - 연령별 회원 수
		List<MemberDTO> memberAgeCount = admdao.memberAgeCount();
		model.addAttribute("memberAgeCount", memberAgeCount);		
		
		return "/admin/admin";
	}
	
	
}
