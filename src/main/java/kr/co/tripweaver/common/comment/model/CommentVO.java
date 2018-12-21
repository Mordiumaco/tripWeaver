package kr.co.tripweaver.common.comment.model;

import java.util.Date;

public class CommentVO {

	private String comt_id; // 댓글ID
	private String comt_cnt; // 내용
	private Date comt_date; // 작성일
	private String comt_secret; // 비밀글여부
	private String comt_del; // 삭제여부
	private String comt_rel_art_id; // 관련글ID
	private String mem_id; // 멤버ID
	private String filter_id; // 분류ID
	private String mem_nick;
	
	
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	
	public String getComt_id() {
		return comt_id;
	}
	public void setComt_id(String comt_id) {
		this.comt_id = comt_id;
	}
	public String getComt_cnt() {
		return comt_cnt;
	}
	public void setComt_cnt(String comt_cnt) {
		this.comt_cnt = comt_cnt;
	}
	public Date getComt_date() {
		return comt_date;
	}
	public void setComt_date(Date comt_date) {
		this.comt_date = comt_date;
	}
	public String getComt_secret() {
		return comt_secret;
	}
	public void setComt_secret(String comt_secret) {
		this.comt_secret = comt_secret;
	}
	public String getComt_del() {
		return comt_del;
	}
	public void setComt_del(String comt_del) {
		this.comt_del = comt_del;
	}
	public String getComt_rel_art_id() {
		return comt_rel_art_id;
	}
	public void setComt_rel_art_id(String comt_rel_art_id) {
		this.comt_rel_art_id = comt_rel_art_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getFilter_id() {
		return filter_id;
	}
	public void setFilter_id(String filter_id) {
		this.filter_id = filter_id;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comt_id=" + comt_id + ", comt_cnt=" + comt_cnt + ", comt_date=" + comt_date
				+ ", comt_secret=" + comt_secret + ", comt_del=" + comt_del + ", comt_rel_art_id=" + comt_rel_art_id
				+ ", mem_id=" + mem_id + ", filter_id=" + filter_id + "mem_nick"+mem_nick+"]";
	}
	
	
	
}
