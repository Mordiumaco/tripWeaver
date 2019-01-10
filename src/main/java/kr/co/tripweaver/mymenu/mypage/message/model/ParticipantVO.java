package kr.co.tripweaver.mymenu.mypage.message.model;

import com.google.gson.Gson;

public class ParticipantVO {
	private String group_id;
	private String mem_id;
	private String chatroom_name;
	private String access;			//채팅방 나가기(exit), 초대(invite) 구분
	private String invite_nick;
	private String invited_nick;
	
	public static ParticipantVO convertMessage(String msg) {
		ParticipantVO participantVO = new ParticipantVO();
		Gson gson = new Gson();
		participantVO = gson.fromJson(msg, ParticipantVO.class);
		return participantVO;
	}
	
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}

	@Override
	public String toString() {
		return "ParticipantVO [group_id=" + group_id + ", mem_id=" + mem_id + ", chatroom_name=" + chatroom_name + "]";
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getInvite_nick() {
		return invite_nick;
	}

	public void setInvite_nick(String invite_nick) {
		this.invite_nick = invite_nick;
	}

	public String getInvited_nick() {
		return invited_nick;
	}

	public void setInvited_nick(String invited_nick) {
		this.invited_nick = invited_nick;
	}
	
}
