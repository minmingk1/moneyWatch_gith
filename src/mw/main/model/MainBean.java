package mw.main.model;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	public String index() {
		return "/index";
	}
	
	@RequestMapping("main.mw")	
	public String aopmain(Model model) {
		Date today = new Date();
		SimpleDateFormat now = new SimpleDateFormat("MMM d, yyyy HH:mm");
		
		MainDTO video = dao.video_url(); //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		model.addAttribute("today", now.format(today));
		model.addAttribute("video", video); //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 url 占쏙옙占쏙옙占쏙옙
		return "/main/main";
	}
	
	@RequestMapping("myPage.mw")	
	public String myPage() {
		return "/main/myPage";
	}

	@RequestMapping("myPageMain.mw")	
	public String myPageMain(Model model) {
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		int thisOut = dao.thisOut(id);
		int thisIn = dao.thisIn(id);
		
		model.addAttribute("thisOut", thisOut);
		model.addAttribute("thisIn", thisIn);
		return "/main/myPageMain";
	}
	
	
	
}
