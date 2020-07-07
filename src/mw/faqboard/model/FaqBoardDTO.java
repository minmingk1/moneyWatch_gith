package mw.faqboard.model;

import java.sql.Timestamp;
import java.lang.Integer;

public class FaqBoardDTO { //유저게시판 DTO
	private int faq_num; //게시글 번호
	private String subject; //게시글 제목
	private String faq_email; //게시글 작성 이메일
	private String content; // 게시글 내용
	private String pw; //게시글 만의 비밀번호
	private int readcount; // 게시글 조회수
	private Timestamp reg; //게시글 작성 시간
	private int ref; 
	private String id; //게시글 작성 ID
	
	
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFaq_email() {
		return faq_email;
	}
	public void setFaq_email(String faq_email) {
		this.faq_email = faq_email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref=ref;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id=id;
	}
}