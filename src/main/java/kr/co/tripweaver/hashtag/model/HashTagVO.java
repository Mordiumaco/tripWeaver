package kr.co.tripweaver.hashtag.model;

public class HashTagVO {
	private String tag_id;
	private String tag_word;
	private String pc_id;
	private int tag_count;
	
	public int getTag_count() {
		return tag_count;
	}
	public void setTag_count(int tag_count) {
		this.tag_count = tag_count;
	}
	public String getTag_id() {
		return tag_id;
	}
	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_word() {
		return tag_word;
	}
	public void setTag_word(String tag_word) {
		this.tag_word = tag_word;
	}
	public String getPc_id() {
		return pc_id;
	}
	public void setPc_id(String pc_id) {
		this.pc_id = pc_id;
	}
	
	
	
	public HashTagVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public HashTagVO(String tag_id, String tag_word, String pc_id, int tag_count) {
		super();
		this.tag_id = tag_id;
		this.tag_word = tag_word;
		this.pc_id = pc_id;
		this.tag_count = tag_count;
	}
	
	
	
	
}
