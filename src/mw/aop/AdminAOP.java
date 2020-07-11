package mw.aop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class AdminAOP {

	public String around(ProceedingJoinPoint jp) throws Throwable{

		ServletRequestAttributes sr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sr.getRequest();
		HttpSession session = request.getSession();

		if(session.getAttribute("memId") != null) {	// ���� ����
			String id = (String)session.getAttribute("memId");			
			if(id.equals("admin")) {
				return (String)jp.proceed();					
			}else{
				//JOptionPane.showMessageDialog(null, "������ ������ �ʿ��մϴ�.");
				return "redirect:/main.mw";
			}
		}else {	
			//JOptionPane.showMessageDialog(null, "������ ������ �ʿ��մϴ�.");
			return "redirect:/index.mw";
		}
	}
	
}
