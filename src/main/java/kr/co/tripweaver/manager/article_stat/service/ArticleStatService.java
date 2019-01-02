package kr.co.tripweaver.manager.article_stat.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.article_stat.dao.IArticleStatDao;
import kr.co.tripweaver.manager.article_stat.model.ArticleStatVO;

@Service
public class ArticleStatService implements IArticleStatService {

	@Autowired
	private IArticleStatDao articleStatDao;
	
	@Override
	public Map<String, Object> selectEssayStat(Map<String, Object> params) {
		
		String dateType = (String) params.get("dateType");
		String datepicker = (String) params.get("datepicker");
		String start = "";	//5기간일자
		String end = "";	//5기간일자
		String start2 = "";	//선택일자
		String end2 = "";	//선택일자
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		Calendar calendar = Calendar.getInstance();
		if(datepicker == null || datepicker.equals("")) {
			Date date = new Date();
			datepicker = format.format(date);
			calendar.setTime(date);
		} else {
			String[] str = datepicker.split("\\.");
			if(dateType.equals("month")) {
				calendar.set(Integer.parseInt(str[0]), Integer.parseInt(str[1])-1, 1);
				datepicker = format.format(calendar.getTime());
			} else if(dateType.equals("day")){
				calendar.set(Integer.parseInt(str[0]), Integer.parseInt(str[1])-1, Integer.parseInt(str[2]));
				datepicker = format.format(calendar.getTime());
			} else {
				datepicker = datepicker.substring(0, 10);
				str = datepicker.split("\\.");
				calendar.set(Integer.parseInt(str[0]), Integer.parseInt(str[1])-1, Integer.parseInt(str[2]));
				System.out.println("[]datepicker : " + datepicker);
				System.out.println("[]calendar.getTime() : " + calendar.getTime());
			}
		}
		
		System.out.println("dateType : " + dateType + " datepicker : " + datepicker);
		
		
		//5개월, 5주, 5일 날짜 구하기(start, end)
		if(dateType.equals("month")) {
			//선택날짜
			start2 = datepicker.substring(0, 7) + ".01";
			end2 = datepicker.substring(0, 7) + "." + calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			//여기서 '일' 다시 설정해줘야 2일 안나옴
			calendar.add(Calendar.MONTH, -2);
			start = format.format(calendar.getTime());
			start = start.substring(0, 7) + ".01";
			calendar.add(Calendar.MONTH, 4);
			end = format.format(calendar.getTime());
			end = end.substring(0, 7) + "."  + calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			System.out.println("[]start : " + start + " end : " + end);
			System.out.println("[]start2 : " + start2 + " end2 : " + end2);
			
		} else if(dateType.equals("week")) {
			//선택날짜
			int dayNum = calendar.get(Calendar.DAY_OF_WEEK);
			if(dayNum == 1) {
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 2) {
				calendar.add(Calendar.DATE, -1);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 3) {
				calendar.add(Calendar.DATE, -2);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 4) {
				calendar.add(Calendar.DATE, -3);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 5) {
				calendar.add(Calendar.DATE, -4);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 6) {
				calendar.add(Calendar.DATE, -5);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			} else if(dayNum == 7) {
				calendar.add(Calendar.DATE, -6);
				start2 = format.format(calendar.getTime());
				calendar.add(Calendar.DATE, 6);
				end2 = format.format(calendar.getTime());
			}
			
			System.out.println("calendar.getTime() : " + calendar.getTime());
			calendar.add(Calendar.DATE, -20);
			start = format.format(calendar.getTime());
			calendar.add(Calendar.DATE, 34);
			end = format.format(calendar.getTime());
			System.out.println("11start : " + start + " end : " + end);
		} else {
			calendar.add(Calendar.DATE, -2);
			start = format.format(calendar.getTime());
			calendar.add(Calendar.DATE, 4);
			end= format.format(calendar.getTime());
			
			//선택날짜
			start2 = datepicker;
			end2 = datepicker;
		}
		
		System.out.println("start : " + start + " end : " + end);
		System.out.println("start2 : " + start2 + " end2 : " + end2);
		
		params.put("start", start);
		params.put("end", end);
		params.put("start2", start2);
		params.put("end2", end2);
		
		//총계그래프
		List<ArticleStatVO> countList = null;
		if(dateType.equals("month")) {
			countList = articleStatDao.selectCountGraphMonth(params);
		} else if(dateType.equals("week")) {
			countList = articleStatDao.selectCountGraphWeek(params);
		} else {
			countList = articleStatDao.selectCountGraphDay(params);
		}
		//시즌그래프
		List<ArticleStatVO> season = articleStatDao.selectSeasonGraph(params);
		//테마그래프
		List<ArticleStatVO> theme = articleStatDao.selectThemeGraph(params);
		//인원그래프
		List<ArticleStatVO> peo = articleStatDao.selectPeoGraph(params);
		//연령대별 성별그래프
		List<ArticleStatVO> age_gen = articleStatDao.selectAgeGenderGraph(params);
		
		
		
		String[] dateStr = {"", "", "", "", ""};
		if(dateType.equals("month")) {
			//start이용해서 {MM월, MM월, MM월, MM월, MM월}
			//calander는 end날짜
			calendar.add(Calendar.MONTH, -4);
			int i = 0;
			for(String str : dateStr) {
				str = format.format(calendar.getTime());
				dateStr[i] = str.substring(5, 7) + "월";
				calendar.add(Calendar.MONTH, +1);
				i++;
			}
		} else if(dateType.equals("week")) {
			//start이용해서 {MM.dd-MM.dd, MM.dd-MM.dd, MM.dd-MM.dd, MM.dd-MM.dd, MM.dd-MM.dd}
			System.out.println(calendar.getTime());
			calendar.add(Calendar.DATE, -34);
			System.out.println(calendar.getTime());
			int i = 0;
			for(String str : dateStr) {
				str = (format.format(calendar.getTime())).substring(5, 10) + "-";
				calendar.add(Calendar.DATE, 6);
				str += (format.format(calendar.getTime())).substring(5, 10); 
				dateStr[i] = str;
				calendar.add(Calendar.DATE, +1);
				i++;
			}
			
		} else {
			//start이용해서 {MM.dd, MM.dd, MM.dd, MM.dd, MM.dd}
			calendar.add(Calendar.DATE, -4);
			int i = 0;
			for(String str : dateStr) {
				str = format.format(calendar.getTime());
				System.out.println("str : " + str);
				dateStr[i] = str.substring(5, 10);
				calendar.add(Calendar.DATE, +1);
				i++;
			}
		}
		
		int[] total = new int[5];
		int[] guide = new int[5];
		int[] normal = new int[5];
		
		for(ArticleStatVO articleStatVO : countList) {
			for(int i = 0; i < dateStr.length; i ++) {
				//월일 경우
				if(dateStr[i].equals(articleStatVO.getEss_month())) {
					total[i] = articleStatVO.getEss_total();
					guide[i] = articleStatVO.getEss_guide();
					normal[i] = articleStatVO.getEss_normal();
				} else if(dateStr[i].equals(articleStatVO.getEss_week())) {
					//주간
					total[i] = articleStatVO.getEss_total();
					guide[i] = articleStatVO.getEss_guide();
					normal[i] = articleStatVO.getEss_normal();
				} else if (dateStr[i].equals(articleStatVO.getEss_day())){
					total[i] = articleStatVO.getEss_total();
					guide[i] = articleStatVO.getEss_guide();
					normal[i] = articleStatVO.getEss_normal();
				}
			}
		}
		
		int[] male = new int[7];
		int[] female = new int[7];
		for(ArticleStatVO articleStatVO : age_gen) {
			if(articleStatVO.getEss_mem_age().equals("0-9")) {
				male[0] = articleStatVO.getEss_mem_male();
				female[0] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("10-19")) {
				male[1] = articleStatVO.getEss_mem_male();
				female[1] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("20-29")) {
				male[2] = articleStatVO.getEss_mem_male();
				female[2] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("30-39")) {
				male[3] = articleStatVO.getEss_mem_male();
				female[3] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("40-49")) {
				male[4] = articleStatVO.getEss_mem_male();
				female[4] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("50-59")) {
				male[5] = articleStatVO.getEss_mem_male();
				female[5] = articleStatVO.getEss_mem_female();
			} else if(articleStatVO.getEss_mem_age().equals("60-")) {
				male[6] = articleStatVO.getEss_mem_male();
				female[6] = articleStatVO.getEss_mem_female();
			}
		}
		
		System.out.println("season : " + season.size() + " theme : " + theme.size() + " peo : " + peo.size() + " age_gen : " + age_gen.size());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("countList", countList);
		resultMap.put("dateStr", dateStr);
		resultMap.put("total", total);
		resultMap.put("guide", guide);
		resultMap.put("normal", normal);
		resultMap.put("season",  season);
		resultMap.put("theme", theme);
		resultMap.put("peo", peo);
		resultMap.put("age_gen", age_gen);
		resultMap.put("male", male);
		resultMap.put("female", female);
		resultMap.put("dateType", dateType);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectPostCardStat(Map<String, Object> params) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		return resultMap;
	}

}
