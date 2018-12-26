package kr.co.tripweaver.mymenu.guideplan.model;

import java.sql.Date;

/**
* GuidePlanVO.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 20.
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
public class GuidePlanVO {
	
	private String guideplan_id;
	private Date guideplan_start_day;
	private Date guideplan_end_day;
	private Integer guideplan_peo_count;
	private String essay_id;
	private Integer total_res_people_count;
	
	
	
	@Override
	public String toString() {
		return "GuidePlanVO [guideplan_id=" + guideplan_id + ", guideplan_start_day=" + guideplan_start_day
				+ ", guideplan_end_day=" + guideplan_end_day + ", guideplan_peo_count=" + guideplan_peo_count
				+ ", essay_id=" + essay_id + ", total_res_people_count=" + total_res_people_count + "]";
	}
	public Integer getTotal_res_people_count() {
		return total_res_people_count;
	}
	public void setTotal_res_people_count(Integer total_res_people_count) {
		this.total_res_people_count = total_res_people_count;
	}
	public String getGuideplan_id() {
		return guideplan_id;
	}
	public void setGuideplan_id(String guideplan_id) {
		this.guideplan_id = guideplan_id;
	}
	public Date getGuideplan_start_day() {
		return guideplan_start_day;
	}
	public void setGuideplan_start_day(Date guideplan_start_day) {
		this.guideplan_start_day = guideplan_start_day;
	}
	public Date getGuideplan_end_day() {
		return guideplan_end_day;
	}
	public void setGuideplan_end_day(Date guideplan_end_day) {
		this.guideplan_end_day = guideplan_end_day;
	}
	public Integer getGuideplan_peo_count() {
		return guideplan_peo_count;
	}
	public void setGuideplan_peo_count(Integer guideplan_peo_count) {
		this.guideplan_peo_count = guideplan_peo_count;
	}
	public String getEssay_id() {
		return essay_id;
	}
	public void setEssay_id(String essay_id) {
		this.essay_id = essay_id;
	}
	
}
