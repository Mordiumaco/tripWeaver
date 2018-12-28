package kr.co.tripweaver.mymenu.reservation.model;

import java.sql.Date;

public class ReservationForMyPageVO {
	
	private Date reser_date;
	private Integer reser_apply_peo_count;
	private String essay_title;
	private String mem_nick;
	private String mem_id;
	private String reser_id;
	private Date guideplan_start_day;
	private Integer rnum;
	
	
	public String getEssay_title() {
		return essay_title;
	}
	public void setEssay_title(String essay_title) {
		this.essay_title = essay_title;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
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
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getReser_id() {
		return reser_id;
	}
	public void setReser_id(String reser_id) {
		this.reser_id = reser_id;
	}
	public Date getGuideplan_start_day() {
		return guideplan_start_day;
	}
	public void setGuideplan_start_day(Date guideplan_start_day) {
		this.guideplan_start_day = guideplan_start_day;
	}
	
	@Override
	public String toString() {
		return "ReservationForMyPageVO [reser_date=" + reser_date + ", reser_apply_peo_count=" + reser_apply_peo_count
				+ ", mem_nick=" + mem_nick + ", mem_id=" + mem_id + ", reser_id=" + reser_id + ", guideplan_start_day="
				+ guideplan_start_day + "]";
	}
	
	
}
