package kr.co.tripweaver.postcard.model;

import java.util.Date;
import java.util.List;

public class PostCardVO {

	private String pc_id ;
	private String pc_cnt;
	private Date pc_date;
	private int pc_view_count;
	private int pc_like_count;
	private String pc_del;
	private String mem_id;
	private String mem_nick;
	private String mem_profile;
	private List<String> hashTagList;
	
	
	public List<String> getHashTagList() {
		return hashTagList;
	}
	public void setHashTagList(List<String> hashTagList) {
		this.hashTagList = hashTagList;
	}
	public String getPc_id() {
		return pc_id;
	}
	public void setPc_id(String pc_id) {
		this.pc_id = pc_id;
	}
	public String getPc_cnt() {
		return pc_cnt;
	}
	public void setPc_cnt(String pc_cnt) {
		this.pc_cnt = pc_cnt;
	}
	public Date getPc_date() {
		return pc_date;
	}
	public void setPc_date(Date pc_date) {
		this.pc_date = pc_date;
	}
	public int getPc_view_count() {
		return pc_view_count;
	}
	public void setPc_view_count(int pc_view_count) {
		this.pc_view_count = pc_view_count;
	}
	public int getPc_like_count() {
		return pc_like_count;
	}
	public void setPc_like_count(int pc_like_count) {
		this.pc_like_count = pc_like_count;
	}
	public String getPc_del() {
		return pc_del;
	}
	public void setPc_del(String pc_del) {
		this.pc_del = pc_del;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	
}
