package kr.co.tripweaver.manager.conn_stat.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.conn_stat.dao.IConnStatDao;
import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

@Service
public class ConnStatService implements IConnStatService {

	@Autowired
	IConnStatDao connStatDao;
	
	@Override
	public int insertConnInfo(ConnStatVO connStatVO) {
		int intCnt = connStatDao.insertConnInfo(connStatVO);
		return intCnt;
	}

	@Override
	public Map<String, Object> selectConnInfo(Map<String, Object> params) {
		String classification = (String) params.get("classification");
		List<ConnStatVO> connStatVOs = connStatDao.selectConnInfo(params);	//접속자 리스트
		int pageCnt = connStatDao.getTotalPageCount();
		
		//여기서 가는구나
//		Map<String, Integer> resultConnStat = selectConnStat(params);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("connStatVOs", connStatVOs);
		resultMap.put("pageCnt", pageCnt);
//		resultMap.put("resultConnStat", resultConnStat);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectConnStat(Map<String, Object> params) {
		String classification = (String) params.get("classification");
		List<ConnStatVO> connStatVOs2 = connStatDao.selectConnStat(params);	//접속통계 일일리스트
		//classification 구분해서 리스트 반복문 돌려서 합하기
		//dateType, classification 반환
		String[] background = {"#FF9000", "#9DCC09", "#71BDE9", "#DE6829", "#EDCE00", "#6B66FF", "#FFB2F5", "#997000"};
		List<Map<String, Object>> series_graph = new ArrayList<Map<String, Object>>();
		List<Map<String, String[]>> series_table = new ArrayList<Map<String, String[]>>();
//		List<String[]> series_table = new ArrayList<String[]>();
		Map<String, Object> map = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(classification.equals("browser")) {
			int chrome = 0;
			int mise = 0;
			int firefox = 0;
			int opera = 0;
			int other = 0;
			for(ConnStatVO connStatVO : connStatVOs2) {
				chrome += connStatVO.getBrow_chrome();
				mise += connStatVO.getBrow_mise();
				firefox += connStatVO.getBrow_firefox();
				opera += connStatVO.getBrow_opera();
				other += connStatVO.getBrow_others();
			}
			//개체 랭킹
			Integer[] ranks = {chrome, mise, firefox, opera, other};
			Arrays.sort(ranks, Collections.reverseOrder());
			int rank = 0;
			int total = chrome + mise + firefox + opera + other;
			
			//chrome
			Map<String, String[]> val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = chrome == ranks[i] ? i+1 : rank ;
			}
			String[] values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "chrome";	//해당 개체 이름
			values[2] = (int)(((float)chrome/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = chrome + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			int[] is = new int[1];				//series_graph value용
			is[0] = chrome;
			map.put("values", is);
			map.put("text", "chrome");
			map.put("data-index", "chrome");
			map.put("background-color", background[0]);
			series_graph.add(map);
			
			//firefox
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = firefox == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "firefox";	//해당 개체 이름
			values[2] = (int)(((float)firefox/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = firefox + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = firefox;
			map.put("values", is);
			map.put("text", "firefox");
			map.put("data-index", "firefox");
			map.put("background-color", background[1]);
			series_graph.add(map);
			
			//mise
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = mise == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "mise";	//해당 개체 이름
			values[2] = ((int)(((float)mise/total)*100)) + "%";	//전체 중 해당 개체 비율
			values[3] = mise + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = mise;
			map.put("values", is);
			map.put("text", "mise");
			map.put("data-index", "mise");
			map.put("background-color", background[2]);
			series_graph.add(map);
			
			//opera
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = opera == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "opera";	//해당 개체 이름
			values[2] = (int)(((float)opera/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = opera + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = opera;
			map.put("values", is);
			map.put("text", "opera");
			map.put("data-index", "opera");
			map.put("background-color", background[3]);
			series_graph.add(map);
			
			//other
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = other == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "other";	//해당 개체 이름
			values[2] = (int)(((float)other/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = other + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = other;
			map.put("values", is);
			map.put("text", "other");
			map.put("data-index", "other");
			map.put("background-color", background[4]);
			series_graph.add(map);
			
		} else if (classification.equals("divice")) {
			int mobile = 0;
			int tablet = 0;
			int pc = 0;
			int other = 0;
			for(ConnStatVO connStatVO : connStatVOs2) {
				mobile += connStatVO.getDivice_mobile();
				tablet += connStatVO.getDivice_tablet();
				pc += connStatVO.getDivice_pc();
				other += connStatVO.getDivice_others();
			}
			Integer[] ranks = {mobile, tablet, pc, other};
			Arrays.sort(ranks, Collections.reverseOrder());
			int rank = 0;
			int total = mobile + tablet + pc + other;
			
			//mobile
			Map<String, String[]> val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = mobile == ranks[i] ? i+1 : rank ;
			}
			String[] values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "mobile";	//해당 개체 이름
			values[2] = (int)(((float)mobile/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = mobile + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			int[] is = new int[1];				//series_graph value용
			is[0] = mobile;
			map.put("values", is);
			map.put("text", "mobile");
			map.put("data-index", "mobile");
			map.put("background-color", background[0]);
			series_graph.add(map);
			
			//tablet
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = tablet == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "tablet";	//해당 개체 이름
			values[2] = (int)(((float)tablet/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = tablet + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = tablet;
			map.put("values", is);
			map.put("text", "tablet");
			map.put("data-index", "tablet");
			map.put("background-color", background[1]);
			series_graph.add(map);
			
			//pc
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = pc == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "pc";	//해당 개체 이름
			values[2] = ((int)(((float)pc/total)*100)) + "%";	//전체 중 해당 개체 비율
			values[3] = pc + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = pc;
			map.put("values", is);
			map.put("text", "pc");
			map.put("data-index", "pc");
			map.put("background-color", background[2]);
			series_graph.add(map);
			
			//other
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = other == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "other";	//해당 개체 이름
			values[2] = ((int)(((float)other/total)*100)) + "%";	//전체 중 해당 개체 비율
			values[3] = other + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = other;
			map.put("values", is);
			map.put("text", "other");
			map.put("data-index", "other");
			map.put("background-color", background[3]);
			series_graph.add(map);
		} else if (classification.equals("referer")) {
			int email = 0;
			int blog = 0;
			int sns = 0;
			int other = 0;
			for(ConnStatVO connStatVO : connStatVOs2) {
				email += connStatVO.getReferer_email();
				blog += connStatVO.getReferer_blog();
				sns += connStatVO.getReferer_sns();
				other += connStatVO.getReferer_others();
			}
			Integer[] ranks = {email, blog, sns, other};
			Arrays.sort(ranks, Collections.reverseOrder());
			int rank = 0;
			int total = email + blog + sns + other;
			
			//eamil
			Map<String, String[]> val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = email == ranks[i] ? i+1 : rank ;
			}
			String[] values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "email";	//해당 개체 이름
			values[2] = (int)(((float)email/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = email + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			int[] is = new int[1];				//series_graph value용
			is[0] = email;
			map.put("values", is);
			map.put("text", "email");
			map.put("data-index", "email");
			map.put("background-color", background[0]);
			series_graph.add(map);
			
			//blog
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = blog == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "blog";	//해당 개체 이름
			values[2] = (int)(((float)blog/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = blog + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = blog;
			map.put("values", is);
			map.put("text", "blog");
			map.put("data-index", "blog");
			map.put("background-color", background[1]);
			series_graph.add(map);
			
			//sns
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = sns == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "sns";	//해당 개체 이름
			values[2] = (int)(((float)sns/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = sns + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = sns;
			map.put("values", is);
			map.put("text", "sns");
			map.put("data-index", "sns");
			map.put("background-color", background[2]);
			series_graph.add(map);
			
			//other
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = other == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "other";	//해당 개체 이름
			values[2] = ((int)(((float)other/total)*100)) + "%";	//전체 중 해당 개체 비율
			values[3] = other + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = other;
			map.put("values", is);
			map.put("text", "other");
			map.put("data-index", "other");
			map.put("background-color", background[3]);
			series_graph.add(map);
			
		} else { //os
			int android = 0;
			int ios = 0;
			int win10 = 0;
			int winxp = 0;
			int winOther = 0;
			int linux = 0;
			int macintosh = 0;
			int other = 0;
			for(ConnStatVO connStatVO : connStatVOs2) {
				android += connStatVO.getOs_android();
				ios += connStatVO.getOs_ios();
				win10 += connStatVO.getOs_windows10();
				winxp += connStatVO.getOs_windowsxp();
				winOther += connStatVO.getOs_windowsothers();
				linux += connStatVO.getOs_linux();
				macintosh += connStatVO.getOs_macintosh();
				other += connStatVO.getOs_others();
			}
			Integer[] ranks = {android, ios, win10, winxp, winOther, linux, macintosh, other};
			Arrays.sort(ranks, Collections.reverseOrder());
			int rank = 0;
			int total = android + ios + win10 + winxp + winOther + linux + macintosh + other;
			
			//android
			Map<String, String[]> val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = android == ranks[i] ? i+1 : rank ;
			}
			String[] values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "android";	//해당 개체 이름
			values[2] = (int)(((float)android/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = android + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			int[] is = new int[1];				//series_graph value용
			is[0] = android;
			map.put("values", is);
			map.put("text", "android");
			map.put("data-index", "android");
			map.put("background-color", background[0]);
			series_graph.add(map);
			
			//ios
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = ios == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "iOS";	//해당 개체 이름
			values[2] = (int)(((float)ios/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = ios + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = ios;
			map.put("values", is);
			map.put("text", "iOS");
			map.put("data-index", "iOS");
			map.put("background-color", background[1]);
			series_graph.add(map);
			
			//win10
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = win10 == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "windows 10";	//해당 개체 이름
			values[2] = (int)(((float)win10/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = win10 + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = win10;
			map.put("values", is);
			map.put("text", "windows 10");
			map.put("data-index", "windows 10");
			map.put("background-color", background[2]);
			series_graph.add(map);
			
			//winxp
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = winxp == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "windows xp";	//해당 개체 이름
			values[2] = (int)(((float)winxp/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = winxp + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = winxp;
			map.put("values", is);
			map.put("text", "windows xp");
			map.put("data-index", "windows xp");
			map.put("background-color", background[3]);
			series_graph.add(map);
			
			//winOther
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = winOther == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "windows other...";	//해당 개체 이름
			values[2] = (int)(((float)winOther/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = winOther + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = winOther;
			map.put("values", is);
			map.put("text", "windows other...");
			map.put("data-index", "windows other...");
			map.put("background-color", background[4]);
			series_graph.add(map);
			
			//linux
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = linux == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "linux";	//해당 개체 이름
			values[2] = (int)(((float)linux/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = linux + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = linux;
			map.put("values", is);
			map.put("text", "linux");
			map.put("data-index", "linux");
			map.put("background-color", background[5]);
			series_graph.add(map);
			
			//macintosh
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = macintosh == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "macintosh";	//해당 개체 이름
			values[2] = (int)(((float)macintosh/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = macintosh + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = macintosh;
			map.put("values", is);
			map.put("text", "macintosh");
			map.put("data-index", "macintosh");
			map.put("background-color", background[6]);
			series_graph.add(map);
			
			//other
			val = new HashMap<String, String[]>();
			for(int i = 0; i < ranks.length; i++) {
				rank = other == ranks[i] ? i+1 : rank ;
			}
			values = new String[4];	//series_table values용
			values[0] = rank + "";	//해당 개체 개수 많은 순서
			values[1] = "other";	//해당 개체 이름
			values[2] = (int)(((float)other/total)*100) + "%";	//전체 중 해당 개체 비율
			values[3] = other + "";	//해당 개체 개수
			val.put("values", values);
			series_table.add(val);
			map = new HashMap<String, Object>();
			is = new int[1];
			is[0] = other;
			map.put("values", is);
			map.put("text", "other");
			map.put("data-index", "other");
			map.put("background-color", background[7]);
			series_graph.add(map);
		}
		
		//표(series_table) 순위 오름차순 정렬
		Collections.sort(series_table, new Comparator<Map<String, String[]>>() {
			@Override
			public int compare(Map<String, String[]> o1, Map<String, String[]> o2) {
				String[] o1str = (String[]) o1.get("values");
				String[] o2str = (String[]) o2.get("values");
				int o1_rank = Integer.parseInt(o1str[0]);
				int o2_rank = Integer.parseInt(o2str[0]);
				return o1str[0].compareTo(o2str[0]);
			}
		});
		
		resultMap.put("series_graph", series_graph);
		resultMap.put("series_table", series_table);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectConnTimeStat(Map<String, Object> params) {
		//매개변수는 선택날짜를 반환
		String datepicker = (String) params.get("datepicker");
		String start = "";
		String end = "";
		String[] str = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		Calendar calendar = Calendar.getInstance();
		Date date = null;
				
		if(datepicker == null || datepicker.equals("")) {
			date = new Date();
			datepicker = format.format(date);
		}
		System.out.println("[selectConnTimeStat] datepicker : " + datepicker);
		//해당 날짜를 받고 전달, 전날 총 3개의 통계 리스트를 받는다
		String year = datepicker.substring(0,4);
		//해당일 통계리스트
		start = datepicker;
		end = datepicker;
		str = datepicker.split("\\.");
		String str_day = str[1] + "월 " + str[2] + "일";
		String input_str_day = str[1] + "." + str[2];
		params.put("start", start);
		params.put("end", end);
		List<ConnStatVO> day = connStatDao.selectConnTimeStat(params);
		
		//전날 통계리스트
		try {
			date = format.parse(datepicker);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendar.setTime(date);
		calendar.add(Calendar.DATE, -1);
		start = format.format(calendar.getTime());
		end = start;
		str = start.split("\\.");
		String str_eve_day = str[1] + "월 " + str[2] + "일";
		params.put("start", start);
		params.put("end", end);
		List<ConnStatVO> eve_day = connStatDao.selectConnTimeStat(params);
		
		//전달 평균 통계리스트
		calendar.clear();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -1);
		//1일 마지막일 구하기
		while (calendar.get(Calendar.DATE) > 1) {
			calendar.add(Calendar.DATE, -1);
		}
		start = format.format(calendar.getTime());
		calendar.add(Calendar.DATE, (calendar.getActualMaximum(Calendar.DAY_OF_MONTH)-1));
		end = format.format(calendar.getTime());
		str = start.split("\\.");
		String str_last_month = str[1] + "월 평균";
		params.put("start", start);
		params.put("end", end);
		List<ConnStatVO> last_month = connStatDao.selectConnTimeStatMonth(params);
		
		System.out.println("day.size() : " + day.size());
		System.out.println("eve_day.size() : " + eve_day.size());
		System.out.println("last_month.size() : " + last_month.size());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("day", day);
		resultMap.put("eve_day", eve_day);
		resultMap.put("last_month", last_month);
		
		//표에 띄어줄 선택날짜 MM월dd일, 전날 MM월dd일, 전달 MM월
		resultMap.put("input_str_day", input_str_day);
		resultMap.put("year", year);
		resultMap.put("str_day", str_day);
		resultMap.put("str_eve_day", str_eve_day);
		resultMap.put("str_last_month", str_last_month);
		
		return resultMap;
	}
}
