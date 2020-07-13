package mw.main.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainBean {
	
	@Autowired
	private MainDAO dao = null; //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙歐占� 占쏙옙占쏙옙 DAO
	
	@RequestMapping("siteMap.mw")	
	public String siteMap() {
		return "/siteMap";
	}
	
	@RequestMapping("index.mw")	
	public String index(HttpSession session) {
		//String path = request.getServletContext().getRealPath("");
		//System.out.println(path);
		
		if(session.getAttribute("memId")!=null) {
			return "redirect:/main.mw";
		}
		
		return "/index";
	}
	
	@RequestMapping("main.mw")	
	public String aopmain(Model model, HttpSession session) {
		Date today = new Date();
		String id = (String)session.getAttribute("memId");
		SimpleDateFormat now = new SimpleDateFormat("MMM d, yyyy HH:mm");
		
		MainDTO video = dao.video_url(); //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		model.addAttribute("today", now.format(today));
		model.addAttribute("video", video); //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 url 占쏙옙占쏙옙占쏙옙
		model.addAttribute("memId", id);
		return "/main/main";
	}
	
	@RequestMapping("myPage.mw")	
	public String myPage(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
//		String id = "nahui068";
		model.addAttribute("memId", id);
		return "/main/myPage";
	}

	@RequestMapping("myPageMain.mw")	
	public String myPageMain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId"); 
		Date today = new Date();
		SimpleDateFormat now = new SimpleDateFormat("MMM dd, yyyy HH:mm");
//		String id = "nahui068";
		try {
			int thisOut = dao.thisOut(id);
			
			//System.out.println("thisIn"+thisIn);
	
			
			
			
			model.addAttribute("thisOut", thisOut);
			
			
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		try {
			int thisIn = dao.thisIn(id);
			model.addAttribute("thisIn", thisIn);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		try {
			String all_balance = dao.all_balance(id);
			model.addAttribute("all_balance", all_balance);
		}catch(NullPointerException e){
			e.printStackTrace();
		}
		model.addAttribute("today", now.format(today));
		return "/main/myPageMain";
	}
	
	
	
}
