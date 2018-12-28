package kr.co.tripweaver.mymenu.reservation.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.member.model.MemberVO;
import kr.co.tripweaver.mymenu.reservation.model.ReservationVO;
import kr.co.tripweaver.mymenu.reservation.service.IReservationService;

@Controller
public class ReservationController {

	Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	IReservationService reservationService;
	
	/**
	* Method : reservationForEssay
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 24.
	* 변경이력 :
	* @param guideplan_id
	* @param guideplan_peo_count
	* @return
	* Method 설명 : 예약 정보를 받고 해당 예약 정보를 DB에 있는 reservation table db 에 기입해준다. 
	*/
	@RequestMapping("reservationForEssay")
	public String reservationForEssay(HttpSession session,ReservationVO reservationVo) {
		
		MemberVO memberVo = (MemberVO)session.getAttribute("loginInfo");
		
		if(memberVo == null) {
			return "loginCheckError";
		}
		
		//해당 로그인한 회원의 정보를 기입해준다. 
		reservationVo.setMem_id(memberVo.getMem_id());
		
		logger.debug("reservation : {}", reservationVo);
		
		int result = reservationService.insertReser(reservationVo);
		
		logger.debug("result: {}", result);
		
		//제대로 정보기입이 안되었으면 에러 페이지로 이동시킨다. 
		if(result == 0) {
			return "dbError";
		}
		
		return "finishUpdate";
	}
	
	
}
