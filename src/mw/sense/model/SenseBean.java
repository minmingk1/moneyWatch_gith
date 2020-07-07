package mw.sense.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SenseBean {
	
	@Autowired
	private SenseDAO dao = null;
	
	//R - 관리자메인 
	@RequestMapping("senseAdmin.mw")
	public String senseAdminMain(Model model) {
	
		SenseDTO video = dao.mainVideo(); //오늘의 영상
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트
		List<SenseDTO> mainlist = dao.mainList(); //메인 리스트
				
		model.addAttribute("video", video); //오늘의 영상 url 보내기
		model.addAttribute("category", category); //카테고리 리스트
		model.addAttribute("list", mainlist); //메인 리스트			

		return "/sense/senseAdmin";
		
	}
	
	//R - 관리자메인 / 카테고리 선택 시 리스트
	@RequestMapping("senseAdminList.mw")
	public String senseAdminCategorySelect(Model model, int num) {
		
		List<SenseDTO> category_select_list = dao.mainCategorySelect(num); //리스트 출력		
		model.addAttribute("list", category_select_list);
		return "/sense/senseAdminList";		
		
	}
	
	//R - 메인 
	@RequestMapping("sense.mw")
	public String senseMain(Model model) {
	
		SenseDTO video = dao.mainVideo(); //오늘의 영상
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트
		List<SenseDTO> mainlist = dao.mainList(); //메인 리스트
				
		model.addAttribute("video", video); //오늘의 영상 url 보내기
		model.addAttribute("category", category); //카테고리 리스트
		model.addAttribute("list", mainlist); //메인 리스트			

		return "/sense/senseMain";
		
	}
	
	//R - 메인 / 카테고리 선택 시 리스트
	@RequestMapping("senseSelect.mw")
	public String senseCategorySelect(Model model, int num) {
		
		List<SenseDTO> category_select_list = dao.mainCategorySelect(num); //리스트 출력		
		model.addAttribute("list", category_select_list);
		return "/sense/mainList";	
		
	}
	
	//R - 마이스크랩 디테일 페이지
	@RequestMapping("senseDetail.mw")
	public String senseDetail(HttpSession session, int num, Model model) { //시퀀스 번호를 매개변수로 받음
		
		String id = (String)session.getAttribute("memId");
		
		ScrapDTO dto = dao.senseDetail(num, id);
		model.addAttribute("detail", dto); //디테일 페이지의 정보를 가져옴
		return "/sense/detail";
		
	}
	
	//R - 디테일 main video url 변경
	@RequestMapping("senseDetailVideo.mw")
	public String senseDetailVideo(HttpSession session, int num, Model model) {
		
		String id = (String)session.getAttribute("memId");
		if( id != "admin") {
			dao.count(num); //조회수를 올림
		}
		SenseDTO dto = dao.senseDetailVideo(num);		
		model.addAttribute("dto", dto);
		return "/sense/video_url";
		
	}
	
	//R - 디테일 조회수 변경
	@RequestMapping("senseReadcount.mw")
	public String senseReadcount(int num, Model model) {
		
		int readcount = dao.readcount(num);
		model.addAttribute("count", readcount);		
		return "/sense/readcount";
		
	}	
	
	//C - 센스 직접 입력 form - 카테고리 selectbox
	@RequestMapping("senseWriteForm.mw")
	public String categorySelect(Model model) {
		
		List<SenseCategoryDTO> list = dao.category(); //카테고리 리스트
		model.addAttribute("list", list);		
		return "/sense/senseWriteForm";
		
	}
	
	//C - 센스 직접 입력 pro페이지 
	@RequestMapping("senseWritePro.mw")
	public String senseWritePro(SenseDTO dto, Model model) {
		
		int maxNum = dao.senseMaxNum() + 1; //mwsense테이블의 num 최댓값을 출력해 +1 해줌
		dto.setNum(maxNum); //dto에 maxNum을 넣어줌
		
		int check = dao.senseInsertCheck(dto); //url or thumbnail 유효성 확인		
		if (check == 0) {
			dao.senseInsert(dto); //입력					
		}
		
		model.addAttribute("check", check); //check 반환
		return "/sense/senseWritePro";
	}
	
	//U - 센스 수정 form페이지
	@RequestMapping("senseModify.mw")
	public String senseModifySelect(int num, Model model) {
		
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트 가져오기
		SenseDTO dto = dao.senseModifySelect(num); //시퀀스 값으로 게시글 내용 호출
		
		model.addAttribute("category", category); //카테고리 리스트
		model.addAttribute("modify", dto); //게시글 내용
		return "/sense/senseModify";
		
	}
	
	//U - 센스 수정 pro페이지
	@RequestMapping("senseModifyPro.mw")
	public String senseModify(SenseDTO dto, Model model) {
		
		int check = dao.modifyCheck(dto); //존재 유효성 확인		
		
		if (check == 1) { //1일 경우 DB수정 진행
			dao.senseModify(dto);				
			check = 2;
		}
		
		model.addAttribute("check", check); // 수정 확인 check 반환
		return "/sense/senseModifyPro";
	}
	
	
	//D - 센스 삭제를 위한 PW확인
	@RequestMapping("senseDeletePro.mw")
	public String confirmPassword(HttpSession session, String password, int num, Model model) {
		
		int check; //반환 정보를 확인하기 위한 값
		String id = (String)session.getAttribute("memId");
		
		if (id == "admin") { //관리자의 경우만 실행
			
			check = dao.confirmPassword(id, password); //id와 pw를 확인함
			
			if (check == 1) { // id/pw가 맞을 때
				
				dao.senseDelete(num); // 센스 게시글 삭제			
				int deleteCheck = dao.senseDeleteCheck(num); // 게시글 삭제 확인 
				
				if(deleteCheck == 0) { // 제대로 삭제 되었을 때
					model.addAttribute("check",check); // 1을 반환
				}else {
					check = -1; //제대로 삭제되지 않았을 때
					model.addAttribute("check", check); // -1을 반환
				}
				
			}else {	// id/pw가 틀릴 때
				model.addAttribute("check",check); // 0을 반환
			}
			
		}else {
			check = 2; //삭제 권한이 없을 경우
			model.addAttribute("check", check); //2를 반환
		}
		return "/sense/senseDeletePro";
	}
	
	
	
	//R - 스크랩 메인페이지
	@RequestMapping("myscrap.mw")
	public String myScrap(HttpSession session, Model model) {
	
		String id = (String)session.getAttribute("memId");
		List<ScrapDTO> dto = dao.myScrap(id); //스크랩 리스트
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트

		model.addAttribute("myscrap", dto); //마이 스크랩리스트
		model.addAttribute("category", category); //카테고리 리스트
		return "/sense/myScrap"; 
		
	}
	
	
	//R - memo창
	@RequestMapping("memo.mw")
	public String memo(int num, Model model) {
		
		SenseDTO dto = (SenseDTO)dao.senseMemo(num); //영상의 정보를 가져옴
		model.addAttribute("dto", dto);
		return "/sense/memo";
		
	}
	
	
	//R - 스크랩 비디오변경
	@RequestMapping("myVideo.mw")
	public String myVideo(HttpSession session, int num, Model model) {
	
		String id = (String)session.getAttribute("memId");
		ScrapDTO dto = (ScrapDTO)dao.myVideo(num, id);
		model.addAttribute("dto",dto);
		return "/sense/myVideo";
		
	}
	
	
	//C - 스크랩 저장
	@RequestMapping("scrap.mw")
	public String scrapInsert(HttpSession session, int num, String memo) {
		
		String id = (String)session.getAttribute("memId");
		dao.scrap(num, id, memo);		
		return "/sense/senseMain";
		
	}
	
	//R - 스크랩 카테고리 선택
	@RequestMapping("myscrapCategory.mw")
	public String myscrapCategory(HttpSession session, int num, Model model) {
		
		String id = (String)session.getAttribute("memId");
		List<ScrapDTO> myscrapCategory = dao.myscrapCategory(id, num); //리스트 출력		
		model.addAttribute("myscraplist", myscrapCategory);
		return "/sense/myScrapList";	
		
	}
	
	
	//D - 스크랩 삭제
	@RequestMapping("scrapDelete.mw")
	public String scrapDelete(HttpSession session, int num, Model model) {
		
		String id = (String)session.getAttribute("memId");
		dao.scrapDelete(num, id);
		List<ScrapDTO> dto = dao.myScrap(id);
		model.addAttribute("myscraplist", dto);		
		return "/sense/myScrapList";
		
	}
	
}
