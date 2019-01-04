package kr.co.tripweaver.mymenu.mypage.tripplan.model;

import java.sql.Date;

/**
* ClusterVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 17.
* @see
* 
* << 클래스 생성 목적 >>
* 메인에 있는 지도에 마커 및 tripplan list를 뿌려주기 위한 목적
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
public class ClusterVO {
	
	private String triparea_id; //여행지 아이디
	private String mapmark_sido; //시도 
	private String mapmark_sigungu; //시군구
	private String mapmarker_enbmyeondong; //읍면동
	private String mapmark_x_coor; //x좌표
	private String mapmark_y_coor; //y좌표
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
	private String mem_nick;
	private String essay_id;
	private Integer essay_meal_exp;
    private Integer essay_traffic_exp;
    private Integer essay_room_exp;
    private Integer essay_other_exp;
	private Integer essay_view_count;
	private Integer totalmoney;
    private Integer essay_like_count;
	private String  mem_profile;
    private String essay_title;
    private Integer rnum;
    private Integer comment_count;
    
    
	public Integer getComment_count() {
		return comment_count;
	}
	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public String getEssay_title() {
		return essay_title;
	}
	public void setEssay_title(String essay_title) {
		this.essay_title = essay_title;
	}
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	public Integer getEssay_view_count() {
		return essay_view_count;
	}
	public void setEssay_view_count(Integer essay_view_count) {
		this.essay_view_count = essay_view_count;
	}
	public Integer getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(Integer totalmoney) {
		this.totalmoney = totalmoney;
	}
	public Integer getEssay_like_count() {
		return essay_like_count;
	}
	public void setEssay_like_count(Integer essay_like_count) {
		this.essay_like_count = essay_like_count;
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
	public String getEssay_id() {
		return essay_id;
	}
	public void setEssay_id(String essay_id) {
		this.essay_id = essay_id;
	}
	public String getTriparea_id() {
		return triparea_id;
	}
	public void setTriparea_id(String triparea_id) {
		this.triparea_id = triparea_id;
	}
	public String getMapmark_sido() {
		return mapmark_sido;
	}
	public void setMapmark_sido(String mapmark_sido) {
		this.mapmark_sido = mapmark_sido;
	}
	public String getMapmark_sigungu() {
		return mapmark_sigungu;
	}
	public void setMapmark_sigungu(String mapmark_sigungu) {
		this.mapmark_sigungu = mapmark_sigungu;
	}
	public String getMapmarker_enbmyeondong() {
		return mapmarker_enbmyeondong;
	}
	public void setMapmarker_enbmyeondong(String mapmarker_enbmyeondong) {
		this.mapmarker_enbmyeondong = mapmarker_enbmyeondong;
	}
	public String getMapmark_x_coor() {
		return mapmark_x_coor;
	}
	public void setMapmark_x_coor(String mapmark_x_coor) {
		this.mapmark_x_coor = mapmark_x_coor;
	}
	public String getMapmark_y_coor() {
		return mapmark_y_coor;
	}
	public void setMapmark_y_coor(String mapmark_y_coor) {
		this.mapmark_y_coor = mapmark_y_coor;
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
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	} 
	
	
	
}
