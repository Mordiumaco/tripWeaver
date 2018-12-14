package kr.co.tripweaver.mymenu.mypage.tripplan.model;

import java.sql.Date;

/**
* DailyPlanVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 12.
* @see
* 
* << 클래스 생성 목적 >>
* 
* Dailyplan table에 대한 정보를 받기위한 객체
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class DailyPlanVO {
	
	private String dailyplan_id; //일일 일정
	private Integer dailyplan_order; //순서
	private String dailyplan_area; //지역
	private String dailyplan_title; //제목..?
	private String dailyplan_cnt; //내욕
	private Date dailyplan_day; //일자
	private String dailyplan_traffic; //교통 
	private String dailyplan_room; //숙소
	private String tripplan_id; //여행일정ID
	
	
	public DailyPlanVO() {
		
	}
	
	public DailyPlanVO(Integer dailyplan_order, String dailyplan_area, String dailyplan_cnt,
			Date dailyplan_day, String dailyplan_traffic, String dailyplan_room, String tripplan_id) {
		this.dailyplan_order = dailyplan_order;
		this.dailyplan_area = dailyplan_area;
		this.dailyplan_cnt = dailyplan_cnt;
		this.dailyplan_day = dailyplan_day;
		this.dailyplan_traffic = dailyplan_traffic;
		this.dailyplan_room = dailyplan_room;
		this.tripplan_id = tripplan_id;
	}
	
	
	public String getDailyplan_id() {
		return dailyplan_id;
	}
	public void setDailyplan_id(String dailyplan_id) {
		this.dailyplan_id = dailyplan_id;
	}
	public Integer getDailyplan_order() {
		return dailyplan_order;
	}
	public void setDailyplan_order(Integer dailyplan_order) {
		this.dailyplan_order = dailyplan_order;
	}
	public String getDailyplan_area() {
		return dailyplan_area;
	}
	public void setDailyplan_area(String dailyplan_area) {
		this.dailyplan_area = dailyplan_area;
	}
	public String getDailyplan_title() {
		return dailyplan_title;
	}
	public void setDailyplan_title(String dailyplan_title) {
		this.dailyplan_title = dailyplan_title;
	}
	public String getDailyplan_cnt() {
		return dailyplan_cnt;
	}
	public void setDailyplan_cnt(String dailyplan_cnt) {
		this.dailyplan_cnt = dailyplan_cnt;
	}
	public Date getDailyplan_day() {
		return dailyplan_day;
	}
	public void setDailyplan_day(Date dailyplan_day) {
		this.dailyplan_day = dailyplan_day;
	}
	public String getDailyplan_traffic() {
		return dailyplan_traffic;
	}
	public void setDailyplan_traffic(String dailyplan_traffic) {
		this.dailyplan_traffic = dailyplan_traffic;
	}
	public String getDailyplan_room() {
		return dailyplan_room;
	}
	public void setDailyplan_room(String dailyplan_room) {
		this.dailyplan_room = dailyplan_room;
	}
	public String getTripplan_id() {
		return tripplan_id;
	}
	public void setTripplan_id(String tripplan_id) {
		this.tripplan_id = tripplan_id;
	}
	
	
}
