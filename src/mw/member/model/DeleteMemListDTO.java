package mw.member.model;

import java.sql.Timestamp;

public class DeleteMemListDTO {
	private int no;			// 번호
	private String id;      // 회원 아이디
	private String name;    // 회원 이름
	private String gender;	// 성별
	private String birth_y; // 출생년
	private String birth_m; // 출생월
	private String birth_d; // 출생일
	private String tel;		// 통신사
	private String phone1;	// 010,011..등등
	private String phone2;	// 폰 중간자리
	private String phone3;	// 폰 마지막자리
	private String reason;	// 탈퇴사유
	private Timestamp reg; 	// 탈퇴날짜

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth_y() {
		return birth_y;
	}

	public void setBirth_y(String birth_y) {
		this.birth_y = birth_y;
	}

	public String getBirth_m() {
		return birth_m;
	}

	public void setBirth_m(String birth_m) {
		this.birth_m = birth_m;
	}

	public String getBirth_d() {
		return birth_d;
	}

	public void setBirth_d(String birth_d) {
		this.birth_d = birth_d;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

}
