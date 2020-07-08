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

import mw.admin.model.AdminDAO;
import mw.admin.model.VisitCountDTO;
import mw.member.model.MemberDAO;


@Controller
public class MemberBean {
	
	@Autowired
	private MemberDAO dao = null;
	@Autowired
	private AdminDAO admdao = null;
	
	@RequestMapping("loginForm.mw")
	public String loginform() {
		return "/member/loginForm";
	}

	@RequestMapping("loginPro.mw")
	public String loginPro(MemberDTO dto, HttpSession session, Model model, HttpServletRequest request) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		dto.setId(id);
		dto.setPw(pw);
		int check=dao.loginCheck(dto);
		
		if(check==1) {
			session.setAttribute("memId", dto.getId());
		
			// 방문자 정보 등록
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			VisitCountDTO vdto = new VisitCountDTO();
	        vdto.setVisit_ip(req.getRemoteAddr());
	        vdto.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
	        vdto.setVisit_refer(req.getHeader("referer"));//접속 전 사이트 정보
	        vdto.setId(id);
	        
	        System.out.println("ip : " + vdto.getVisit_ip());
	        System.out.println("agent : " + vdto.getVisit_agent());
	        System.out.println("refer : " + vdto.getVisit_refer());
	        
			try {
				admdao.insertVisitor(vdto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model.addAttribute("check",check);
		return "/member/loginPro";
	}
	
	@RequestMapping("logout.mw")
	public String aoplogout(HttpSession session) {
		session.invalidate();	
		return "/member/logout";
	}
	
	@RequestMapping("registerForm.mw")
	public String registerForm() {
		return "/member/registerForm";
	}

	@RequestMapping("registerPro.mw")
	public String registerPro(MemberDTO dto) {
		dao.insert(dto);	
		return "/member/registerPro";
	}
	
	
	@RequestMapping("confirmId.mw") //아이디 중복 체크
	public String confirmId(String id,Model model) {
		int check=dao.memberCheck(id);
		model.addAttribute("check",check);
		
		return "/member/confirmId";
	}
	
	@RequestMapping("modifyForm.mw") // 회원정보 수정
	public String aopmodifyForm(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memId");
		MemberDTO dto =dao.modifyCheck(id);
		model.addAttribute("dto",dto);
	
		return "/member/modifyForm";
	}
	
	@RequestMapping("modifyForm_sub.mw") // 회원정보 수정 탑에도 있어야하고 마이페이지안에도 있어야 하기 때문에 2개임
	public String aopmodifyForm_sub(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memId");// 서버에 있는 세션을 가지고와 id에 저장
		MemberDTO dto =dao.modifyCheck(id); // 그 아이디를 dto에 넣고  
		model.addAttribute("dto",dto); //모델.에드어트류뷰트로 name="dto"에 dto겍체를 추가한다.
	
		return "/member/modifyForm_sub";
	}

	@RequestMapping("modifyPro.mw") // 회원정보를 업데이트 시킴
	public String aopmodifyPro(MemberDTO dto,HttpSession session) {
		String id=(String)session.getAttribute("memId"); // 서버에 있는 세션을 가지고와 id에 저장
		dto.setId(id);// 서버에서 가지고온 id를 dto에set로 저장

		dao.updateMember(dto); // set으로 저장된 dto를 dao.updateMember메서드로 업데이트 시킴
		
		return "/member/modifyPro";
	}
	

	@RequestMapping("memOutForm.mw")
	public String aopmemOutForm() {
		return "/member/memOutForm";
	}
	
	@RequestMapping("memOutForm_sub.mw")
	public String aopmemOutForm_sub() {
		return "/member/memOutForm_sub";
	}
	
	@RequestMapping("memOutPro.mw") // 회원탈퇴
	public String aopmemOutPro(MemberDTO dto , Model model, DeleteMemListDTO dto2 , HttpServletRequest request, HttpSession session) {
		String pw =request.getParameter("pw"); // "pw" 값을 요청.겟 파라미터로 가지고와 pw에 저장 
		String id =(String)session.getAttribute("memId"); // 서버에 있는 세션을 가지고와 id에 저장
		
		int check = dao.deleteCheck(id,pw); // 다오 deleteCheck메서드로 id,pw 체크
		
		model.addAttribute("check",check); //모델.에드어트류뷰트로"check"이름으로 check겍체를 추가
		
		System.out.println(id); // 콘솔창에 출력이 되는지 확인하는
		System.out.println(pw);
		System.out.println(check);
				
		if(check==1) { // 조건이 맞다면 삭제진행
			
			  String reason=request.getParameter("reason");
			  
			  MemberDTO dto1=dao.deleteSelect(id); // deleteSelect메서드로 id를 검색 된값을 dto1에 저장
			  
			  dto2.setId(dto1.getId()); // dto1 저장된 값을 dto2에 set로 저장 시키고
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
			  
			  dao.deleteInsert(dto2); // 위에 값을deleteInsert로 넣음
		
			  dao.deleteMem(id); //삭제 진행
			  session.invalidate();
		}
		return "/member/memOutPro";
	}
	@RequestMapping("memList.mw") //운영자가 회원을 검색
	public String memList(MemberDTO dto, Model model,HttpServletRequest request, HttpSession session){ 
	
		List list=null; //선언부
		list=dao.selectMemList(dto); // list 에 dto 저장
	  
		model.addAttribute("list", list); //"list"이름으로 list겍체 추가
	
		String keyField=request.getParameter("keyField"); 
		String keyWord=request.getParameter("keyWord");
	
		if(keyField != null) {
			List search=dao.memSearch(keyField,keyWord);
			
			model.addAttribute("search", search);
			
		}
		return "/admin/memList"; 
	}
	
	@RequestMapping("adminMemDel.mw")
	public String adminMemDel(Model model ,MemberDTO dto ,HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		
		model.addAttribute("id", id);
		return "/admin/adminMemDel";
	}
	
	@RequestMapping("adminMemDelPro.mw") // 운영자가 회원을 제명
	public String adminMemDelPro(MemberDTO dto , DeleteMemListDTO dto2 ,HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		
		
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
		
		return "/admin/adminMemDelPro";
	
	}
}