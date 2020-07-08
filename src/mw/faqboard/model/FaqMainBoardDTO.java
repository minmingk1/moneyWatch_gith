package mw.faqboard.model;

import java.util.List;
import java.sql.Timestamp;

public class FaqMainBoardDTO {
	private int qnum;
	private String nickname;
	private String qsubject;
	private String qcontent;
	private int qreadcount;
	private Timestamp reg;
	private String q_id;

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}

	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getQsubject() {
		return qsubject;
	}

	public void setQsubject(String qsubject) {
		this.qsubject = qsubject;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public int getQreadcount() {
		return qreadcount;
	}

	public void setQreadcount(int qreadcount) {
		this.qreadcount = qreadcount;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
}
