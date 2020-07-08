package mw.faqboard.model;

import java.sql.Timestamp;
import java.lang.Integer;

public class FaqBoardDTO { //유저 게시판 DTO
	private int faq_num; //글번호
	private String subject;//글제목
	private String content;//글내용
	private String pw;//게시글 비밀번호
	private int readcount;//조회수
	private Timestamp reg;//글쓴 시간
	private String id;//글쓴이 ID

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}