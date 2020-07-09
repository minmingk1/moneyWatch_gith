package mw.faqboard.model;

import java.sql.Timestamp;

public class FaqReplyDTO {
	
	private int num; //댓글번호
	private int faq_num; //게시글번호
	private String id; //회원ID
	private String content; //내용
	private Timestamp reg; //댓글 게시시간
	
	
	//getter
	public int getNum() {
		return num;
	}
	
	public int getFaq_num() {
		return faq_num;
	}
	
	public String getId() {
		return id;
	}
	
	public String getContent() {
		return content;
	}
	
	public Timestamp getReg() {
		return reg;
	}
	
	
	//setter
	public void setNum(int num) {
		this.num = num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

}
