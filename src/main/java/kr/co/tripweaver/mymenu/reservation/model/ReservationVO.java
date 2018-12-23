package kr.co.tripweaver.mymenu.reservation.model;

import java.sql.Date;

public class ReservationVO {
	
	private String reser_id;
	private Date reser_date;
	private Integer reser_apply_peo_count;
	private String mem_id;
	private String guideplan_id;
	
	public String getReser_id() {
		return reser_id;
	}
	public void setReser_id(String reser_id) {
		this.reser_id = reser_id;
	}
	public Date getReser_date() {
		return reser_date;
	}
	public void setReser_date(Date reser_date) {
		this.reser_date = reser_date;
	}
	public Integer getReser_apply_peo_count() {
		return reser_apply_peo_count;
	}
	public void setReser_apply_peo_count(Integer reser_apply_peo_count) {
		this.reser_apply_peo_count = reser_apply_peo_count;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGuideplan_id() {
		return guideplan_id;
	}
	public void setGuideplan_id(String guideplan_id) {
		this.guideplan_id = guideplan_id;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [reser_id=" + reser_id + ", reser_date=" + reser_date + ", reser_apply_peo_count="
				+ reser_apply_peo_count + ", mem_id=" + mem_id + ", guideplan_id=" + guideplan_id + "]";
	}
	
	
}
