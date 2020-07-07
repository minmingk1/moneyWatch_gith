package mw.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mw.admin.model.VisitCountDAO;
import mw.admin.model.VisitCountDTO;
import mw.member.model.MemberDAO;


@Controller


public class MemberBean {
	
	@Autowired
	private MemberDAO dao = null;
	@Autowired
	private VisitCountDAO vdao = null;
	
	@RequestMapping("loginForm.mw") //로그인
	public String loginform() {
		return "/member/loginForm";
	}

	@RequestMapping("loginPro.mw") //로그인 체크
	public String loginPro(MemberDTO dto, HttpSession session, Model model, HttpServletRequest request) {
		String id=(String)session.getAttribute(dto.getId());
		String pw=request.getParameter(dto.getPw());
		int check=dao.loginCheck(dto);
		
		if(check==1) {
		session.setAttribute("memId", dto.getId());
		
		// 방문자 정보 등록
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		VisitCountDTO vdto = new VisitCountDTO();
        vdto.setVisit_ip(req.getRemoteAddr());
        vdto.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
        vdto.setVisit_refer(req.getHeader("referer"));//접속 전 사이트 정보
        
        try {
			vdao.insertVisitor(vdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
		model.addAttribute("check",check);
		return "/member/loginPro";
	}
	
	@RequestMapping("logout.mw") //로그아웃 세션 삭제
	public String aoplogout(HttpSession session) {
		session.invalidate();	
		return "/member/logout";
	}
	
	@RequestMapping("registerForm.mw")	//회원가입
	public String registerForm() {
		return "/member/registerForm";
	}

	@RequestMapping("registerPro.mw")	//회원가입 실행
	public String registerPro(MemberDTO dto) {
		dao.insert(dto);	
		return "/member/registerPro";
	}
	
	
	@RequestMapping("confirmId.mw") //아이디 체크
	public String confirmId(String id,Model model) {
		int check=dao.memberCheck(id);
		model.addAttribute("check",check);
		
		return "/member/confirmId";
	}
	
	@RequestMapping("modifyForm.mw") //회원 정보에 맞는 데이터 받아서 리턴
	public String aopmodifyForm(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memId");
		MemberDTO dto =dao.modifyCheck(id);
		model.addAttribute("dto",dto);
	
		return "/member/modifyForm";
	}
	
	
	@RequestMapping("modifyPro.mw") //정보수정 실행
	public String aopmodifyPro(MemberDTO dto) {
		dao.updateMember(dto);
		
		return "/member/modifyPro";
	}
	

	@RequestMapping("memOutForm.mw") //회원탈퇴
	public String aopmemOutForm() {
		return "/member/memOutForm";
	}
	
	@RequestMapping("memOutPro.mw") //탈퇴 요청회원 검색,진행
	public String aopmemOutPro(MemberDTO dto , Model model, DeleteMemListDTO dto2 , HttpServletRequest request, HttpSession session) {
		String pw =request.getParameter("pw");
		String id =(String)session.getAttribute("memId");
		
		int check = dao.deleteCheck(id,pw);
		
		model.addAttribute("check",check);
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(check);
				
		if(check==1) { // 삭제 진행
			
			  String reason=request.getParameter("reason");
			  
			  MemberDTO dto1=dao.deleteSelect(id);
			  
			  dto2.setId(dto1.getId()); 
			  dto2.setName(dto1.getName());
			  dto2.setGender(dto1.getGender()); 
			  dto2.setBirth_y(dto1.getBirth_y());
			  dto2.setBirth_m(dto1.getBirth_m()); 
			  dto2.setBirth_d(dto1.getBirth_d());
			  dto2.setTel(dto1.getTel()); 
			  dto2.setPhone1(dto1.getPhone1());
			  dto2.setPhone2(dto1.getPhone2()); 
			  dto2.setPhone3(dto1.getPhone3());
			  dto2.setReason(reason);
			  dto2.setReg(dto1.getReg());
			  
			  dao.deleteInsert(dto2);
		
			  dao.deleteMem(id);
			  session.invalidate();
		}
		return "/member/memOutPro";
	}
	/*
	 * @RequestMapping("memList.mw") //회원 리스트 출력 public String memList(MemberDTO dto
	 * , Model model,HttpServletRequest request, HttpSession session) { List
	 * list=null; list=dao.selectMemList(dto);
	 * 
	 * 
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * String keyField=request.getParameter("keyField"); String
	 * keyWord=request.getParameter("keyWord");
	 * 
	 * String search=dao.memSearch(keyField,keyWord);
	 * 
	 * model.addAttribute("search", search);
	 * 
	 * return "/member/memList"; }
	 */
		
	}