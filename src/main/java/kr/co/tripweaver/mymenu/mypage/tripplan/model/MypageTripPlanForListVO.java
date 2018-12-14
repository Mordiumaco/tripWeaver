package kr.co.tripweaver.mymenu.mypage.tripplan.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
* MypageTripPlanForListVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 13.
* @see
* 
* << 클래스 생성 목적 >>
* 
*my page의 나의 여행 일정 리스트를 뿌려주기 위해 만든 객체
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class MypageTripPlanForListVO {
	
	String tripplan_id; 
	Date tripplan_start_day; //출발일
	String tripplan_days; //여행일수
	String tripplan_image; //대표이미지
	String mapmark_sido; //시도
	String mapmarker_enbmyeondong; //읍면동
	String tripplan_title; //제목
	String totalmarker_count;
	
	public String getTripplan_id() {
		return tripplan_id;
	}
	public void setTripplan_id(String tripplan_id) {
		this.tripplan_id = tripplan_id;
	}
	public Date getTripplan_start_day() {
		return tripplan_start_day;
	}
	public void setTripplan_start_day(Date tripplan_start_day) {
		this.tripplan_start_day = tripplan_start_day;
	}
	public String getTripplan_days() {
		return tripplan_days;
	}
	public void setTripplan_days(String tripplan_days) {
		this.tripplan_days = tripplan_days;
	}
	public String getTripplan_image() {
		return tripplan_image;
	}
	public void setTripplan_image(String tripplan_image) {
		this.tripplan_image = tripplan_image;
	}
	public String getMapmark_sido() {
		return mapmark_sido;
	}
	public void setMapmark_sido(String mapmark_sido) {
		this.mapmark_sido = mapmark_sido;
	}
	public String getMapmarker_enbmyeondong() {
		return mapmarker_enbmyeondong;
	}
	public void setMapmarker_enbmyeondong(String mapmarker_enbmyeondong) {
		this.mapmarker_enbmyeondong = mapmarker_enbmyeondong;
	}
	public String getTripplan_title() {
		return tripplan_title;
	}
	public void setTripplan_title(String tripplan_title) {
		this.tripplan_title = tripplan_title;
	}
	public String getTotalmarker_count() {
		return totalmarker_count;
	}
	public void setTotalmarker_count(String totalmarker_count) {
		this.totalmarker_count = totalmarker_count;
	}
	
	@Override
	public String toString() {
		return "MypageTripPlanForListVO [tripplan_id=" + tripplan_id + ", tripplan_start_day=" + tripplan_start_day
				+ ", tripplan_days=" + tripplan_days + ", tripplan_image=" + tripplan_image + ", mapmark_sido="
				+ mapmark_sido + ", mapmarker_enbmyeondong=" + mapmarker_enbmyeondong + ", tripplan_title="
				+ tripplan_title + ", totalmarker_count=" + totalmarker_count + "]";
	}
	
	
	
	
}
