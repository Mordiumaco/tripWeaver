package kr.co.tripweaver.mymenu.mypage.tripplan.model;

/**
* MapMarkerVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 12.
* @see
* 
* << 클래스 생성 목적 >>
*  mapMarkerVO 를 받기위한 목적
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
public class MapMarkerVO {
	
	private String triparea_id; //여행지 아이디
	private String mapmark_sido; //시도 
	private String mapmark_sigungu; //시군구
	private String mapmarker_enbmyeondong; //읍면동
	private String mapmark_x_coor; //x좌표
	private String mapmark_y_coor; //y좌표
	
	
	
	
	public MapMarkerVO(String triparea_id, String mapmark_sido, String mapmark_sigungu, String mapmarker_enbmyeondong,
			String mapmark_x_coor, String mapmark_y_coor) {
		
		this.triparea_id = triparea_id;
		this.mapmark_sido = mapmark_sido;
		this.mapmark_sigungu = mapmark_sigungu;
		this.mapmarker_enbmyeondong = mapmarker_enbmyeondong;
		this.mapmark_x_coor = mapmark_x_coor;
		this.mapmark_y_coor = mapmark_y_coor;
		
	}
	
	
	public MapMarkerVO() {
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
	
	
}
