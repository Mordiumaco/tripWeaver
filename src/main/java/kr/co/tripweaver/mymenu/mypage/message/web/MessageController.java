package kr.co.tripweaver.mymenu.mypage.message.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.mypage.message.model.MessageVO;
import kr.co.tripweaver.mymenu.mypage.message.model.ParticipantVO;
import kr.co.tripweaver.mymenu.mypage.message.service.IMessageService;

@RequestMapping("/message")
@Controller
public class MessageController {
	
	@Autowired
	private IMessageService messageService;
	
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
	
	
}
