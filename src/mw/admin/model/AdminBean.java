package mw.admin.model;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBean {

	
	
	@RequestMapping("admin.mw")
	public String admin(Model model) {
		String id = "admin";
		
		model.addAttribute("id", id);
		
		return "/admin/admin";
	}
	
	
}
