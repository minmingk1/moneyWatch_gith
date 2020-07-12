package mw.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class Advice {

	public String around(ProceedingJoinPoint jp) throws Throwable{

		ServletRequestAttributes sr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sr.getRequest();
		HttpSession session = request.getSession();
		
		if(session != null) {	// 세션 존재
			String id = (String)session.getAttribute("memId");			
			
			if(id == null || id.equals("")) {	// 세션 ID정보값 없다면(로그아웃상태)				
				return "redirect:/index.mw";	// 로그인 페이지로 이동
			}
		}		
		return (String)jp.proceed();
	}
	
}
