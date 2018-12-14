package kr.co.tripweaver.mymenu.mypage.tripplan.model;

/**
* TripareaVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 12.
* @see
* 
* << 클래스 생성 목적 >>
* 
*Triparea table의 정보를 받기 위한 객체 
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
public class TripareaVO {
	
	private String triparea_id; //여행지 아이디
	private Integer triparea_stay_days; //숙박기간
	private Integer triparea_order; //순서
	private String tripplan_id; //여행지ID
	
	
	
	public TripareaVO() {
		
	}
	
	public TripareaVO(Integer triparea_stay_days, Integer triparea_order, String tripplan_id) {
		this.triparea_stay_days = triparea_stay_days;
		this.triparea_order = triparea_order;
		this.tripplan_id = tripplan_id;
	}
	
	public String getTriparea_id() {
		return triparea_id;
	}
	
	public void setTriparea_id(String triparea_id) {
		this.triparea_id = triparea_id;
	}
	public Integer getTriparea_stay_days() {
		return triparea_stay_days;
	}
	public void setTriparea_stay_days(Integer triparea_stay_days) {
		this.triparea_stay_days = triparea_stay_days;
	}
	public Integer getTriparea_order() {
		return triparea_order;
	}
	public void setTriparea_order(Integer triparea_order) {
		this.triparea_order = triparea_order;
	}
	public String getTripplan_id() {
		return tripplan_id;
	}
	public void setTripplan_id(String tripplan_id) {
		this.tripplan_id = tripplan_id;
	}
	
	
}
