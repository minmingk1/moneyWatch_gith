package mw.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class AdminAOP {

	public String around(ProceedingJoinPoint jp) throws Throwable{

		ServletRequestAttributes sr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sr.getRequest();
		HttpSession session = request.getSession();
		
		if(session != null) {	// 세션 존재
			String id = (String)session.getAttribute("memId");
			if(id.equals("admin")) {
				return (String)jp.proceed();					
			}
		}				
		return "redirect:/index.mw";
	}
	
}
