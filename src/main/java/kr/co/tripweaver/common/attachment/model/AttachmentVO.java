package kr.co.tripweaver.common.attachment.model;

public class AttachmentVO {
	
	private String att_id; // 첨부파일ID
	private String att_path; // 첨부파일경로
	private String att_file_name; // 첨부파일명
	private String att_file_ori_name; // 첨부파일원본명
	private String att_rel_art_id; // 관련글ID
	private String filter_id; // 분류ID
	
	
	public String getAtt_id() {
		return att_id;
	}
	public void setAtt_id(String att_id) {
		this.att_id = att_id;
	}
	public String getAtt_path() {
		return att_path;
	}
	public void setAtt_path(String att_path) {
		this.att_path = att_path;
	}
	public String getAtt_file_name() {
		return att_file_name;
	}
	public void setAtt_file_name(String att_file_name) {
		this.att_file_name = att_file_name;
	}
	public String getAtt_file_ori_name() {
		return att_file_ori_name;
	}
	public void setAtt_file_ori_name(String att_file_ori_name) {
		this.att_file_ori_name = att_file_ori_name;
	}
	public String getAtt_rel_art_id() {
		return att_rel_art_id;
	}
	public void setAtt_rel_art_id(String att_rel_art_id) {
		this.att_rel_art_id = att_rel_art_id;
	}
	public String getFilter_id() {
		return filter_id;
	}
	public void setFilter_id(String filter_id) {
		this.filter_id = filter_id;
	}
	
	
	@Override
	public String toString() {
		return "AttachmentVO [att_id=" + att_id + ", att_path=" + att_path + ", att_file_name=" + att_file_name
				+ ", att_file_ori_name=" + att_file_ori_name + ", att_rel_art_id=" + att_rel_art_id + ", filter_id="
				+ filter_id + "]";
	}
	
	

}
