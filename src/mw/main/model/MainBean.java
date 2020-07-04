package mw.main.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainBean {
	
	@Autowired
	private MainDAO dao = null; //���� ������ ����ϱ� ���� DAO
	
	@RequestMapping("siteMap.mw")	
	public String siteMap() {
		return "/siteMap";
	}
	
	@RequestMapping("index.mw")	
	public String index() {
		return "/index";
	}
	
	@RequestMapping("main.mw")	
	public String main(Model model) {
		
		MainDTO video = dao.video_url(); //������ ����
		model.addAttribute("video", video); //������ ���� url ������
		return "/main/main";
	}
	
	@RequestMapping("myPage.mw")	
	public String myPage() {
		return "/main/myPage";
	}

	@RequestMapping("myPageMain.mw")	
	public String myPageMain(Model model) {
		String id = "nahui068";
		int thisOut = dao.thisOut(id);
		int thisIn = dao.thisIn(id);
		
		model.addAttribute("thisOut", thisOut);
		model.addAttribute("thisIn", thisIn);
		return "/main/myPageMain";
	}
	
	
	
}
