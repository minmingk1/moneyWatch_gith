package mw.faqboard.model;

import java.sql.Timestamp;

public class FaqReplyDTO {
	
	private int num; //��۹�ȣ
	private int faq_num; //�Խñ۹�ȣ
	private String id; //ȸ��ID
	private String content; //����
	private Timestamp reg; //��� �Խýð�
	private int counter; //��� ����

	
	
	
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
	
	public int getCounter() {
		return counter;
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
	
	public void setCounter(int counter) {
		this.counter = counter;
	}

}
