package kr.co.tripweaver.board.model;

import java.util.Date;

public class BoardVO {
	
	private String board_id; // 게시판ID
	private String board_title; // 제목
	private Date board_date; // 생성일
	private String board_use; // 사용여부
	private String board_del; // 삭제여부
	private String mem_id; // 멤버ID(생성자)
	
	public BoardVO() {}
	
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_use() {
		return board_use;
	}
	public void setBoard_use(String board_use) {
		this.board_use = board_use;
	}
	public String getBoard_del() {
		return board_del;
	}
	public void setBoard_del(String board_del) {
		this.board_del = board_del;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", board_title=" + board_title + ", board_date=" + board_date
				+ ", board_use=" + board_use + ", board_del=" + board_del + ", mem_id=" + mem_id + "]";
	}
	
	
}
