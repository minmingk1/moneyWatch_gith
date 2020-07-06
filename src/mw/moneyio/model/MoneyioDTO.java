package mw.moneyio.model;

import java.text.DecimalFormat;

public class MoneyioDTO {

	private int io_num; //sequence 번호
	private String io_category; //카테고리
	private String io_detail; //세부내역
	private String io_reg_date;	//날짜
	private int io_price; //거래금액
	private int io_remain; //거래잔액
	private String io_bank; //대상(은행/카드)
	private String io_account;  //거래번호(계좌/카드번호)
	private String id; //회원ID
	private int io_N_div; //N빵 0/N
	private int io_set; //구분 0/1(수입/지출)
	private String io_age; //나이
	private int count3; //예상지출액을 위한 카테고리 카운트
	
	public int getIo_num() {
		return io_num;
	}
	public void setIo_num(int io_num) {
		this.io_num = io_num;
	}
	public String getIo_category() {
		return io_category;
	}
	public void setIo_category(String io_category) {
		this.io_category = io_category;
	}
	public String getIo_detail() {
		return io_detail;
	}
	public void setIo_detail(String io_detail) {
		this.io_detail = io_detail;
	}
	public String getIo_reg_date() {
		return io_reg_date;
	}
	public void setIo_reg_date(String io_reg_date) {
		this.io_reg_date = io_reg_date;
	}
	public int getIo_price() {
		return io_price;
	}
	public void setIo_price(int io_price) {
		
		this.io_price = io_price;
	}
	public int getIo_remain() {
		
		return io_remain;
	}
	public void setIo_remain(int io_remain) {

		this.io_remain = io_remain;
	}
	public String getIo_bank() {
		return io_bank;
	}
	public void setIo_bank(String io_bank) {
		this.io_bank = io_bank;
	}
	public String getIo_account() {
		return io_account;
	}
	public void setIo_account(String io_account) {
		this.io_account = io_account;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIo_N_div() {
		return io_N_div;
	}
	public void setIo_N_div(int io_N_div) {
		this.io_N_div = io_N_div;
	}
	public int getIo_set() {
		return io_set;
	}
	public void setIo_set(int io_set) {
		this.io_set = io_set;
	}
	public String getIo_age() {
		return io_age;
	}
	public void setIo_age(String io_age) {
		this.io_age = io_age;
	}
	public int getCount3() {
		return count3;
	}
	public void setCount3(int count3) {
		this.count3 = count3;
	}
	
}
