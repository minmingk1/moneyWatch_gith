package mw.sense.model;

public class SenseCategoryDTO {
	private int num; //번호
	private String sense_detail_category; //금융세부카테고리
	private int count;	// 카테고리 별 개수
	
	//setter
	public void setNum(int num) {
		this.num = num;
	}
	public void setSense_detail_category(String sense_detail_category) {
		this.sense_detail_category = sense_detail_category;
	}
	
	//getter
	public int getNum() {
		return num;
	}
	public String getSense_detail_category() {
		return sense_detail_category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
