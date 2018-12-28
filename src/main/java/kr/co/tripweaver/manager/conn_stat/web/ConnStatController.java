package kr.co.tripweaver.manager.conn_stat.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;
import kr.co.tripweaver.manager.conn_stat.service.IConnStatService;
import kr.co.tripweaver.util.model.PageVO;

@RequestMapping("/connStat")
@Controller
public class ConnStatController {

	@Autowired
	private IConnStatService connStatService;
	
	@RequestMapping("/connStatList")
	public String connStatList(@RequestParam("dateType") String dateType, @RequestParam("classification") String classification, PageVO pageVO, Model model) {
		System.out.println("[ConnStatController] connStatList 입장");
		//필요정보
		//접속자 정보 리스트
		//통계결과
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("pageVO", pageVO);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		String datePicker = format.format(date);
		String start = "";
		String end = "";
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		if(dateType.equals("month")) {
			start = datePicker.substring(0, 7) + ".01";
			end = datePicker.substring(0, 7) + "." + calendar.getActualMaximum(Calendar.DAY_OF_MONTH); //마지막 날짜 계산해서 더해주기
		} else if(dateType.equals("week")) {
			//일~월 날짜로 변환해서 넣기
			//현재날짜의 요일을 구해서 요리에 따라 start end +-해서 주 시작(일)날짜 주 마지막날짜(토)
			int dayNum = calendar.get(Calendar.DAY_OF_WEEK);
			if(dayNum == 1) {
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 2) {
				calendar.add(Calendar.DATE, -1);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 3) {
				calendar.add(Calendar.DATE, -2);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 4) {
				calendar.add(Calendar.DATE, -3);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 5) {
				calendar.add(Calendar.DATE, -4);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 6) {
				calendar.add(Calendar.DATE, -5);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			} else if(dayNum == 7) {
				calendar.add(Calendar.DATE, -6);
				start = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end = format.format(calendar.getTime());
			}
		} else {
			start = datePicker;
			end = datePicker;
		}
		System.out.println("[No] dateType : " + dateType + " classification : " + classification + " datePicker : " + datePicker + " start : " + start + " end : " + end);
		params.put("dateType", dateType);
		params.put("classification", classification);
		params.put("start", start);
		params.put("end", end);
		
		Map<String, Object> resultMap = connStatService.selectConnInfo(params);
		resultMap.put("pageVO", pageVO);
		resultMap.put("dateType", dateType);
		resultMap.put("classification", classification);
		model.addAllAttributes(resultMap);
		model.addAttribute("gnb", 3);
		System.out.println("[ConnStatController] connStatList 퇴장");
		return "/admin/statistics/contact";
	}
	
	//접속자 통계 리스트 아작스
	@RequestMapping("/contactListAjax")
	public String contactListAjax(PageVO pageVO, Model model) {
		System.out.println("[ConnStatController] contactListAjax 입장");
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("pageVO", pageVO);
		
		Map<String, Object> resultMap = connStatService.selectConnInfo(params);
		resultMap.put("pageVO", pageVO);
		model.addAllAttributes(resultMap);
		System.out.println("[ConnStatController] contactListAjax 퇴장");
		return "/admin/statistics/contact_list_ajax";
	}
	
	//접속자 통꼐 그래프 아작스
	@ResponseBody
	@RequestMapping("/contactGraphAjax")
	public Map<String, Object> contactGraphAjax(@RequestParam("dateType") String dateType, @RequestParam("sel_ca_id") String classification, @RequestParam("datepicker") String datePicker,Model model) {
		System.out.println("[ConnStatController] contactGraphAjax 입장");
		//dateType : 'month', 'week', 'day'
		//classification : 'browser', 'divice', 'referer', 'os'
		System.out.println("[datePicker1] datePicker : " + datePicker);
		if(datePicker == null || datePicker.equals("")) {
			Date date = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
			if(dateType.equals("month")) {
				datePicker = format.format(date);
				datePicker = datePicker.substring(0, 7);
			} else if(dateType.equals("week")) { 
				int dayNum = calendar.get(Calendar.DAY_OF_WEEK);
				if(dayNum == 1) {
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 2) {
					calendar.add(Calendar.DATE, -1);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 3) {
					calendar.add(Calendar.DATE, -2);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 4) {
					calendar.add(Calendar.DATE, -3);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 5) {
					calendar.add(Calendar.DATE, -4);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 6) {
					calendar.add(Calendar.DATE, -5);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				} else if(dayNum == 7) {
					calendar.add(Calendar.DATE, -6);
					datePicker = format.format(calendar.getTime());
					calendar.add(Calendar.DATE, 6);
					datePicker += "-" + format.format(calendar.getTime());
				}
			} else {
				datePicker = format.format(date);
			}
		}
		
		System.out.println("[datePicker2] datePicker : " + datePicker);
		String start = "";
		String end = "";
		if(dateType.equals("month")) {
			start = datePicker + ".01";
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.parseInt(datePicker.substring(0, 4)), Integer.parseInt(datePicker.substring(5)), 1);
			end = datePicker + "." + calendar.getActualMaximum(Calendar.DAY_OF_MONTH); //마지막 날짜 계산해서 더해주기
		} else if(dateType.equals("week")) {
			String[] str = datePicker.split("-");
			start = str[0];
			end = str[1];
		} else {
			start = datePicker;
			end = datePicker;
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println("[Ajax] dateType : " + dateType + " classification : " + classification + " datePicker : " + datePicker + " start : " + start + " end : " + end);
		params.put("dateType", dateType);
		params.put("classification", classification);
		params.put("start", start);
		params.put("end", end);
		params.put("pageVO", new PageVO(1, 10));
		Map<String, Object> resultMap = connStatService.selectConnStat(params);
		resultMap.put("dateType", dateType);
		resultMap.put("classification", classification);
		model.addAllAttributes(resultMap);

		System.out.println("[ConnStatController] contactGraphAjax 퇴장");
		
		return resultMap;
//		return "/admin/statistics/contact_graph_ajax";
	}
	
	@RequestMapping("/connStatTime")
	public String connStatTime(Model model) {
		
		Map<String, Object> params = new HashMap<String,Object>();
		
		
		return "";
	}
}
