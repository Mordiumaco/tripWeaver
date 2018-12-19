package kr.co.tripweaver.common.comment.model;

import java.util.Date;

public class CommentVO {
	
	private String comt_id;
	private String comt_cnt;
	private Date comt_date;
	private String comt_secret;
	private String comt_del;
	private String comt_rel_art_id;
	private String mem_id;
	private String filter_id;
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
	
	
	
}
