package mw.error.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorBean {
	
	String path = "/error";
	
	@RequestMapping(value="/no_resource")
	public String noResource() {
		return path+"/no_resource";
	}
	
	@RequestMapping(value="/server")
	public String noServer() {
		return path+"/server";
	}
	
	@RequestMapping(value="error")
	public String Error() {
		return path+"/error";
	}
	
}
