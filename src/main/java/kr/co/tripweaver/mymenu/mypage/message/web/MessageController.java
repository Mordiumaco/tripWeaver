package kr.co.tripweaver.mymenu.mypage.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@RequestMapping("/message")
@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	private Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping("/mainView")
	public String messageView(MemberVO memberVO, Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mem_id", memberVO.getMem_id());
		params.put("stx", "");
		Map<String, Object> resultMap = messageService.messagePageView(params);
		model.addAllAttributes(resultMap);
		
		return "mypage/message/message";
	}
	
	@RequestMapping("/chatRoomListView")
	public String chattingView(MemberVO memberVO, Model model) {
		List<MessageVO> messageVOs = messageService.selectChatroom(memberVO.getMem_id());
		model.addAttribute("messageVOs", messageVOs);
		return "mypage/message/chatting";
	}
	
	@RequestMapping("/chatRoomListViewRenew")
	public String chatRoomListViewRenew(MemberVO memberVO, Model model) {
		System.out.println("memberVO.getMem_id() : " + memberVO.getMem_id());
		List<MessageVO> messageVOs = messageService.selectChatroom(memberVO.getMem_id());
		model.addAttribute("messageVOs", messageVOs);
		return "mypage/message/chattingAjax";
	}
	
	@RequestMapping("/chatRoomDetailView")
	public String chatting_viewView(MessageVO messageVO, Model model) {
		String group_id = messageVO.getGroup_id();
		ParticipantVO participantVO = new ParticipantVO();
		participantVO.setGroup_id(group_id);
		participantVO.setMem_id(messageVO.getMem_id());
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("group_id", group_id);
		params.put("participantVO", participantVO);
		
		Map<String, Object> resultMap = messageService.enterChatroom(params);
		model.addAllAttributes(resultMap);
		return "mypage/message/chatting_view";
	}
	
	@RequestMapping("/searchFollow")
	public String searchFollow(MemberVO memberVO, @RequestParam("stx") String stx, Model model) {
		System.out.println("@RequestMapping(\"/searchFollow\") : " + stx + " : " + memberVO.getMem_id());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mem_id", memberVO.getMem_id());
		params.put("stx", stx);
		Map<String, Object> resultMap = messageService.messagePageView(params);
		model.addAllAttributes(resultMap);
		
		return "mypage/message/message";
	}
	
	@RequestMapping("/createChatroomView")
	public String createChatroomView(MemberVO memberVO,Model model) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mem_id", memberVO.getMem_id());
		params.put("stx", "");
		Map<String, Object> resultMap = messageService.messagePageView(params);
		model.addAllAttributes(resultMap);
		return "mypage/message/createChatroom";
	}
	
	@RequestMapping("/searchChatroomCreate")
	public String searchChatroomCreate(MemberVO memberVO, @RequestParam("stx") String stx, Model model) {
		System.out.println("@RequestMapping(\"/searchFollow\") : " + stx + " : " + memberVO.getMem_id());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("mem_id", memberVO.getMem_id());
		params.put("stx", stx);
		Map<String, Object> resultMap = messageService.messagePageView(params);
		model.addAllAttributes(resultMap);
		
		return "mypage/message/createChatroom";
	}
	
	@RequestMapping("createChatroom")
	public String createChatroom(@RequestParam("memberList") String memberList, @RequestParam("chatroom_name") String chatroom_name, MemberVO memberVO, Model model) {
		//채팅방 구성원리스트
		String[] inviteList = memberList.split(";");
		String loginInfo = memberVO.getMem_id();
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("inviteList", inviteList);
		params.put("loginInfo", loginInfo);
		params.put("chatroom_name", chatroom_name);
		
		Map<String, Object> resultMap = messageService.insertChatroom(params);
		
		//모델에 값 넘기기
		model.addAllAttributes(resultMap);
		
		return "mypage/message/chatting_view";
	}
	
	@RequestMapping("exitChatroom")
	public String exitChatroom(ParticipantVO participantVO, Model model) {
		//채팅방 구성원에서 삭제
		int delCnt = messageService.exitChatroom(participantVO);
		
		List<MessageVO> messageVOs = messageService.selectChatroom(participantVO.getMem_id());
		model.addAttribute("messageVOs", messageVOs);
		
		return "mypage/message/chatting";
	}
	
	@RequestMapping("alram")
	@ResponseBody
	public int alram(MemberVO memberVO, Model model) {
		int cnt = messageService.messageAlram(memberVO.getMem_id());
		return cnt;
	}
	
	@RequestMapping("selectMessage11")
	public String selectMessage11(@RequestParam("login_id") String login_id, @RequestParam("mem_id") String mem_id, Model model) {
		logger.debug("login_id : " + login_id + " mem_id : " + mem_id);
		Map<String, Object> resultMap = messageService.selectMessage11(login_id, mem_id);
		model.addAllAttributes(resultMap);
		return "mypage/message/chatting_view";
	}
}
