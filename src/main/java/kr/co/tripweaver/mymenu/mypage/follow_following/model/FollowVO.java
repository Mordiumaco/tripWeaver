package kr.co.tripweaver.mymenu.mypage.follow_following.model;

public class FollowVO {
	
	private String mem_id2;	//팔로우한멤버(팔로우버튼을 누른 사람)
	private String mem_id;	//팔로로된멤버(팔로우버튼을 눌림 당한 사람)
	private int fol_state;	//맞팔여부

	public FollowVO() {
		super();
	}
	public FollowVO(String mem_id2, String mem_id) {
		super();
		this.mem_id2 = mem_id2;
		this.mem_id = mem_id;
	}
	
	public FollowVO(String mem_id2, String mem_id, int fol_state) {
		super();
		this.mem_id2 = mem_id2;
		this.mem_id = mem_id;
		this.fol_state = fol_state;
	}
	public int getFol_state() {
		return fol_state;
	}

	public void setFol_state(int fol_state) {
		this.fol_state = fol_state;
	}

	public String getMem_id2() {
		return mem_id2;
	}
	public void setMem_id2(String mem_id2) {
		this.mem_id2 = mem_id2;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "FollowVO [mem_id2=" + mem_id2 + ", mem_id=" + mem_id + "]";
	}
}
