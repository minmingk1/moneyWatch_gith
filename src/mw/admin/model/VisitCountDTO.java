package mw.admin.model;

public class VisitCountDTO {
	private int visit_no;
    private String visit_ip;
    private String visit_time;
    private String visit_refer;
    private String visit_agent;
	
    
    
    public int getVisit_no() {
		return visit_no;
	}
	public void setVisit_no(int visit_no) {
		this.visit_no = visit_no;
	}
	public String getVisit_ip() {
		return visit_ip;
	}
	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}
	public String getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}
	public String getVisit_refer() {
		return visit_refer;
	}
	public void setVisit_refer(String visit_refer) {
		this.visit_refer = visit_refer;
	}
	public String getVisit_agent() {
		return visit_agent;
	}
	public void setVisit_agent(String visit_agent) {
		this.visit_agent = visit_agent;
	}
    
    
}
