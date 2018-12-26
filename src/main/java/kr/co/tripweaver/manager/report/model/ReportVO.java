package kr.co.tripweaver.manager.report.model;

import java.util.Date;

public class ReportVO {
	private String 	report_id;
	private Date 	report_accept_date;
	private String 	rep_cnt;
	private String 	report_proc_sta;
	private String 	report_rel_art_id;
	private String	mem_id;
	private String  filter_id;
	private int		rep_rea_id;
	private String  rep_rea_name;
	
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public Date getReport_accept_date() {
		return report_accept_date;
	}
	public void setReport_accept_date(Date report_accept_date) {
		this.report_accept_date = report_accept_date;
	}
	public String getRep_cnt() {
		return rep_cnt;
	}
	public void setRep_cnt(String rep_cnt) {
		this.rep_cnt = rep_cnt;
	}
	public String getReport_proc_sta() {
		return report_proc_sta;
	}
	public void setReport_proc_sta(String report_proc_sta) {
		this.report_proc_sta = report_proc_sta;
	}
	public String getReport_rel_art_id() {
		return report_rel_art_id;
	}
	public void setReport_rel_art_id(String report_rel_art_id) {
		this.report_rel_art_id = report_rel_art_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getFilter_id() {
		return filter_id;
	}
	public void setFilter_id(String filter_id) {
		this.filter_id = filter_id;
	}
	public int getRep_rea_id() {
		return rep_rea_id;
	}
	public void setRep_rea_id(int rep_rea_id) {
		this.rep_rea_id = rep_rea_id;
	}
	public String getRep_rea_name() {
		return rep_rea_name;
	}
	public void setRep_rea_name(String rep_rea_name) {
		this.rep_rea_name = rep_rea_name;
	}
	
	
	
	
	
}                   
