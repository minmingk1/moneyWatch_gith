package mw.error.model;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorBean {

	@RequestMapping("error.mw")
	public String Error() {
		return "/error/error";
	}
	
}
