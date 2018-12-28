package kr.co.tripweaver.essay.model;

import java.sql.Date;

/**
* EssayVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 19.
* @see
* 
* << 클래스 생성 목적 >>
* 
*
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class EssayVO {
	
	private String  essay_id;
	private String  essay_title;
	private String  essay_cnt;
	private Date    essay_date;
	private String  essay_filter;
	private Integer essay_like_count;
	private Integer essay_view_count;
	private String  essay_del;
	private Integer essay_meal_exp;
	private Integer essay_traffic_exp;
	private Integer essay_room_exp;
	private Integer essay_other_exp;
	private String  mem_id;
	private String  tripplan_id;
	private String  tripplan_image;
	private Integer rnum;
	
	
	
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public String getTripplan_image() {
		return tripplan_image;
	}
	public void setTripplan_image(String tripplan_image) {
		this.tripplan_image = tripplan_image;
	}
	public String getEssay_id() {
		return essay_id;
	}
	public void setEssay_id(String essay_id) {
		this.essay_id = essay_id;
	}
	public String getEssay_title() {
		return essay_title;
	}
	public void setEssay_title(String essay_title) {
		this.essay_title = essay_title;
	}
	public String getEssay_cnt() {
		return essay_cnt;
	}
	public void setEssay_cnt(String essay_cnt) {
		this.essay_cnt = essay_cnt;
	}
	public Date getEssay_date() {
		return essay_date;
	}
	public void setEssay_date(Date essay_date) {
		this.essay_date = essay_date;
	}
	public String getEssay_filter() {
		return essay_filter;
	}
	public void setEssay_filter(String essay_filter) {
		this.essay_filter = essay_filter;
	}
	public Integer getEssay_like_count() {
		return essay_like_count;
	}
	public void setEssay_like_count(Integer essay_like_count) {
		this.essay_like_count = essay_like_count;
	}
	public Integer getEssay_view_count() {
		return essay_view_count;
	}
	public void setEssay_view_count(Integer essay_view_count) {
		this.essay_view_count = essay_view_count;
	}
	public String getEssay_del() {
		return essay_del;
	}
	public void setEssay_del(String essay_del) {
		this.essay_del = essay_del;
	}
	public Integer getEssay_meal_exp() {
		return essay_meal_exp;
	}
	public void setEssay_meal_exp(Integer essay_meal_exp) {
		this.essay_meal_exp = essay_meal_exp;
	}
	public Integer getEssay_traffic_exp() {
		return essay_traffic_exp;
	}
	public void setEssay_traffic_exp(Integer essay_traffic_exp) {
		this.essay_traffic_exp = essay_traffic_exp;
	}
	public Integer getEssay_room_exp() {
		return essay_room_exp;
	}
	public void setEssay_room_exp(Integer essay_room_exp) {
		this.essay_room_exp = essay_room_exp;
	}
	public Integer getEssay_other_exp() {
		return essay_other_exp;
	}
	public void setEssay_other_exp(Integer essay_other_exp) {
		this.essay_other_exp = essay_other_exp;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTripplan_id() {
		return tripplan_id;
	}
	public void setTripplan_id(String tripplan_id) {
		this.tripplan_id = tripplan_id;
	}
	
	@Override
	public String toString() {
		return "EssayVO [essay_id=" + essay_id + ", essay_title=" + essay_title + ", essay_cnt=" + essay_cnt
				+ ", essay_date=" + essay_date + ", essay_filter=" + essay_filter + ", essay_like_count="
				+ essay_like_count + ", essay_view_count=" + essay_view_count + ", essay_del=" + essay_del
				+ ", essay_meal_exp=" + essay_meal_exp + ", essay_traffic_exp=" + essay_traffic_exp
				+ ", essay_room_exp=" + essay_room_exp + ", essay_other_exp=" + essay_other_exp + ", mem_id=" + mem_id
				+ ", tripplan_id=" + tripplan_id + "]";
	}
	

	
}
