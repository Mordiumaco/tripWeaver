package kr.co.tripweaver.mymenu.mypage.tripplan.model;

import java.sql.Date;

/**
* TripplanVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 12.
* @see
* 
* << 클래스 생성 목적 >>
* 
* tripplan table 정보를 받기위한 객체 
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class TripplanVO {
	
	private String tripplan_id; //여행일정 ID
	private String tripplan_title; //제목
	private String tripplan_theme; //여행테마코드
	private String tripplan_season; //시즌테마코드
	private String tripplan_peo_type; //인원 타입
	private Date tripplan_start_day; //출발일
	private Integer tripplan_days; //여행일수
	private Integer tripplan_peo_count; //인원
	private String mem_id; //작성자 아이디
	private String tripplan_image; //대표 이미지
	
	
	public TripplanVO() {
		
	}
	
	public TripplanVO(String tripplan_title, String tripplan_theme, String tripplan_season, String tripplan_peo_type,
			Date tripplan_start_day, Integer tripplan_days, Integer tripplan_peo_count, String mem_id,
			String tripplan_image) {
		this.tripplan_title = tripplan_title;
		this.tripplan_theme = tripplan_theme;
		this.tripplan_season = tripplan_season;
		this.tripplan_peo_type = tripplan_peo_type;
		this.tripplan_start_day = tripplan_start_day;
		this.tripplan_days = tripplan_days;
		this.tripplan_peo_count = tripplan_peo_count;
		this.mem_id = mem_id;
		this.tripplan_image = tripplan_image;
	}
	
	public String getTripplan_id() {
		return tripplan_id;
	}
	public void setTripplan_id(String tripplan_id) {
		this.tripplan_id = tripplan_id;
	}
	public String getTripplan_title() {
		return tripplan_title;
	}
	public void setTripplan_title(String tripplan_title) {
		this.tripplan_title = tripplan_title;
	}
	public String getTripplan_theme() {
		return tripplan_theme;
	}
	public void setTripplan_theme(String tripplan_theme) {
		this.tripplan_theme = tripplan_theme;
	}
	public String getTripplan_season() {
		return tripplan_season;
	}
	public void setTripplan_season(String tripplan_season) {
		this.tripplan_season = tripplan_season;
	}
	public String getTripplan_peo_type() {
		return tripplan_peo_type;
	}
	public void setTripplan_peo_type(String tripplan_peo_type) {
		this.tripplan_peo_type = tripplan_peo_type;
	}
	public Date getTripplan_start_day() {
		return tripplan_start_day;
	}
	public void setTripplan_start_day(Date tripplan_start_day) {
		this.tripplan_start_day = tripplan_start_day;
	}
	public Integer getTripplan_days() {
		return tripplan_days;
	}
	public void setTripplan_days(Integer tripplan_days) {
		this.tripplan_days = tripplan_days;
	}
	public Integer getTripplan_peo_count() {
		return tripplan_peo_count;
	}
	public void setTripplan_peo_count(Integer tripplan_peo_count) {
		this.tripplan_peo_count = tripplan_peo_count;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getTripplan_image() {
		return tripplan_image;
	}
	public void setTripplan_image(String tripplan_image) {
		this.tripplan_image = tripplan_image;
	}
	
}
