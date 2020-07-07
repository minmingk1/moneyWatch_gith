package mw.faqboard.model;

import java.sql.Timestamp;
import java.lang.Integer;

public class FaqBoardDTO { //�����Խ��� DTO
	private int faq_num; //�Խñ� ��ȣ
	private String subject; //�Խñ� ����
	private String content; // �Խñ� ����
	private String pw; //�Խñ� ���� ��й�ȣ
	private int readcount; // �Խñ� ��ȸ��
	private Timestamp reg; //�Խñ� �ۼ� �ð�
	private int ref; 
	private String id; //�Խñ� �ۼ� ID
	
	
	
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