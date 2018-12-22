package kr.co.tripweaver.manager.conn_stat.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.tripweaver.manager.conn_stat.service.IConnStatService;

@RequestMapping("/connStat")
@Controller
public class ConnStatController {

	@Autowired
	private IConnStatService connStatService;
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String selectConnInfo(Model model) {
		
		Map<String, Object> params = new HashMap<String,Object>();
		
		
		return "";
	}
}
