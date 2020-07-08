package mw.chat.model;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatBean {

	@RequestMapping("chat.mw")
	public String chat(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("memId");
		
		model.addAttribute("id", id);
		
		return "chat/chat";
	}
	
}
