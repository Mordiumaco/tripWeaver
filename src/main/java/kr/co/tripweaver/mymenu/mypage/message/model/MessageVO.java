package kr.co.tripweaver.mymenu.mypage.message.model;

import java.util.Date;

import com.google.gson.Gson;

public class MessageVO {
	
	private int unread;
	private String mem_profile;
	private String mem_nick;
	private String msg_id;
	private Date msg_date;
	private String msg_cnt;
	private String mem_id;
	private String group_id;
	private String chatroom_name;
	private int cnt;				//채팅방인원수
	private int rec_cnt;			//읽지않은 메세지 수
	
	public static MessageVO convertMessage(String msg) {
		MessageVO messageVO = new MessageVO();
		Gson gson = new Gson();
		messageVO = gson.fromJson(msg, MessageVO.class);
		return messageVO;
	}
	
	
	public int getRec_cnt() {
		return rec_cnt;
	}
	public void setRec_cnt(int rec_cnt) {
		this.rec_cnt = rec_cnt;
	}
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getUnread() {
		return unread;
	}
	public void setUnread(int unread) {
		this.unread = unread;
	}
	public String getMem_profile() {
		return mem_profile;
	}
	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_cnt() {
		return msg_cnt;
	}
	public void setMsg_cnt(String msg_cnt) {
		this.msg_cnt = msg_cnt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	@Override
	public String toString() {
		return "MessageVO [unread=" + unread + ", mem_profile=" + mem_profile + ", mem_nick=" + mem_nick + ", msg_id="
				+ msg_id + ", msg_date=" + msg_date + ", msg_cnt=" + msg_cnt + ", mem_id=" + mem_id + ", group_id="
				+ group_id + ", chatroom_name=" + chatroom_name + "]";
	}
	
	
}
