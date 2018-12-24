package kr.co.tripweaver.manager.conn_stat.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.tripweaver.manager.conn_stat.service.IConnStatService;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/connStat")
@Controller
public class ConnStatController {

	@Autowired
	private IConnStatService connStatService;
	
	@RequestMapping("/connStatList")
	public String connStatList(PageVO pageVO, Model model) {
		//필요정보
		//접속자 정보 리스트
		//통계결과
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("pageVO", pageVO);
		
		Map<String, Object> resultMap = connStatService.selectConnInfo(params);
		resultMap.put("pageVO", pageVO);
		model.addAllAttributes(resultMap);
		
		return "/admin/statistics/contact";
	}
	
	@RequestMapping("/connStatTime")
	public String connStatTime(Model model) {
		
		Map<String, Object> params = new HashMap<String,Object>();
		
		
		return "";
	}
}
