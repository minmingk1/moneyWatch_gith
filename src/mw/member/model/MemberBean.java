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
	
	@RequestMapping("loginForm.mw")//회원가입 FORM
	public String loginform() {
		return "/member/loginForm";
	}

	@RequestMapping("loginPro.mw")//회원가입 실행
	public String loginPro(MemberDTO dto, HttpSession session, Model model, HttpServletRequest request) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		dto.setId(id); //dto의 set 메서드에 바로 넣음
		dto.setPw(pw); //dto의 set 메서드에 바로 넣음
		int check=dao.loginCheck(dto);
		
		if(check==1) {
			session.setAttribute("memId", dto.getId()); //id session 키 등록
		
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
	
	@RequestMapping("logout.mw") // 로그아웃 실행
	public String aoplogout(HttpSession session) {
		session.invalidate(); //session을 지워줌
		return "/member/logout";
	}
	
	@RequestMapping("registerForm.mw") //회원 가입 FORM
	public String registerForm() {
		return "/member/registerForm";
	}

	@RequestMapping("registerPro.mw") //회원 가입 진행
	public String registerPro(MemberDTO dto) {
		dao.insert(dto); //dto로 데이터 삽입
		return "/member/registerPro";
	}
	
	
	@RequestMapping("confirmId.mw") //아이디 중복 체크
	public String confirmId(String id,Model model) {
		int check=dao.memberCheck(id); //id로 검색해서 check로 반환받음
		model.addAttribute("check",check);
		model.addAttribute("id",id);
		
		return "/member/confirmId";
	}
	
	@RequestMapping("modifyForm.mw") // 회원정보 수정
	public String aopmodifyForm(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memId");
		MemberDTO dto =dao.modifyCheck(id); //id로 수정할 정보 반환 받음
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
	

	@RequestMapping("memOutForm.mw")// 회원탈퇴 FORM
	public String aopmemOutForm() {
		return "/member/memOutForm";
	}
	//마이페이지에서 사용하는 회원탈퇴
	@RequestMapping("memOutForm_sub.mw")
	public String aopmemOutForm_sub() {
		return "/member/memOutForm_sub";
	}
	
	@RequestMapping("memOutPro.mw") // 회원탈퇴
	public String aopmemOutPro(MemberDTO dto , Model model, DeleteMemListDTO dto2 , HttpServletRequest request, HttpSession session) {
		String pw =request.getParameter("pw"); // "pw" 값을 요청.겟 파라미터로 가지고와 pw에 저장 
		String id =(String)session.getAttribute("memId"); // 서버에 있는 세션을 가지고와 id에 저장
		
		int check = dao.deleteCheck(id,pw); // deleteCheck메서드로 id,pw 체크
		
		model.addAttribute("check",check); //모델로 check 저장
		
		
				
		if(check==1) { // 조건이 맞다면 삭제진행
			
			  String reason=request.getParameter("reason");
			  
			  MemberDTO dto1=dao.deleteSelect(id); // deleteSelect메서드로 id로 검색 하여 dto1에 저장
			  // memberDTO에 get메서드 가져와서 deleteMemListDTO의 set메서드에 저장 
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
			  dto2.setReason(reason); //탈퇴 사유
			  dto2.setReg(dto1.getReg());
			  
			  dao.deleteInsert(dto2); // 위에 값을 deleteInsert로 넣음
		
			  dao.deleteMem(id); //삭제 진행
			  session.invalidate();//session 삭제
		}
		return "/member/memOutPro";
	}
	@RequestMapping("memList.mw") //운영자가 회원을 검색
	public String memList(MemberDTO dto, Model model,HttpServletRequest request, HttpSession session){ 
	
		List list=null; //선언부
		list=dao.selectMemList(dto); // list 에 dto 저장
	  
		model.addAttribute("list", list); //"list"이름으로 list객체 추가
	
		String keyField=request.getParameter("keyField"); // name or id
		String keyWord=request.getParameter("keyWord"); // text에 입력한 값
	
		if(keyField != null) {
			List search=dao.memSearch(keyField,keyWord);// 위에서 받은 두개 값으로 검색된 값 List에 담아서 반환 받음
			
			model.addAttribute("search", search);
			
		}
		return "/admin/memList"; 
	}
	
	@RequestMapping("adminMemDel.mw") //운영자가 회원 삭제 FORM
	public String adminMemDel(Model model ,MemberDTO dto ,HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		
		model.addAttribute("id", id);
		return "/admin/adminMemDel";
	}
	
	@RequestMapping("adminMemDelPro.mw") // 운영자가 회원을 제명
	public String adminMemDelPro(MemberDTO dto , DeleteMemListDTO dto2 ,HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");
		
		
		String reason=request.getParameter("reason"); // 삭제 시킨 사유를 받아옴
		  
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
		  
		  dao.deleteInsert(dto2); //deleteMemListDTO에 삽입
		
		  dao.deleteMem(id); //id로 삭제 진행
		
		return "/admin/adminMemDelPro";
	
	}
}