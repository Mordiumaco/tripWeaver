package kr.co.tripweaver.article.model;

import java.util.Date;

public class ArticleVO {

	private String art_id; // 게시글 ID
	private String art_title; // 제목
	private String art_cnt; // 내용
	private String art_groupid; // 그룹ID
	private Date art_date; // 작성일
	private String art_secret; // 비밀글여부
	private String art_del; // 삭제여부
	private String board_id; // 게시판 ID
	private String mem_id; // 멤버 ID(작성자)
	private String art_par_id; // 부모게시글ID
	private int rnum; // 
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getArt_id() {
		return art_id;
	}
	public void setArt_id(String art_id) {
		this.art_id = art_id;
	}
	public String getArt_title() {
		return art_title;
	}
	public void setArt_title(String art_title) {
		this.art_title = art_title;
	}
	public String getArt_cnt() {
		return art_cnt;
	}
	public void setArt_cnt(String art_cnt) {
		this.art_cnt = art_cnt;
	}
	public String getArt_groupid() {
		return art_groupid;
	}
	public void setArt_groupid(String art_groupid) {
		this.art_groupid = art_groupid;
	}
	public Date getArt_date() {
		return art_date;
	}
	public void setArt_date(Date art_date) {
		this.art_date = art_date;
	}
	public String getArt_secret() {
		return art_secret;
	}
	public void setArt_secret(String art_secret) {
		this.art_secret = art_secret;
	}
	public String getArt_del() {
		return art_del;
	}
	public void setArt_del(String art_del) {
		this.art_del = art_del;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getArt_par_id() {
		return art_par_id;
	}
	public void setArt_par_id(String art_par_id) {
		this.art_par_id = art_par_id;
	}
	
	
	@Override
	public String toString() {
		return "ArticleVO [art_id=" + art_id + ", art_title=" + art_title + ", art_cnt=" + art_cnt + ", art_groupid="
				+ art_groupid + ", art_date=" + art_date + ", art_secret=" + art_secret + ", art_del=" + art_del
				+ ", board_id=" + board_id + ", mem_id=" + mem_id + ", art_par_id=" + art_par_id + ", rnum=" + rnum
				+ "]";
	}
	
	
	
	
}
