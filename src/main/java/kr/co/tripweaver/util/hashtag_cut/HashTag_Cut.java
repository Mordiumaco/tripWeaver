package kr.co.tripweaver.util.hashtag_cut;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class HashTag_Cut {
	public static List<String> extractHashTagTest(String hashtagCnt) {		
		Logger logger = LoggerFactory.getLogger(HashTag_Cut.class);
				
	    Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
	    Matcher m = p.matcher(hashtagCnt);
	    String extractHashTag = null;
	    
	    List<String> hashTagList = new ArrayList<String>();
	    while(m.find()) {
	    extractHashTag = sepcialCharacter_replace(m.group());
	 
		    if(extractHashTag != null) {
		    	logger.debug("최종 추출 해시태그 :: {}", extractHashTag);
		    	hashTagList.add(extractHashTag);
		    }
	    }
	    return hashTagList;
	}
	
	public static String sepcialCharacter_replace(String str) {
	    str = StringUtils.replaceChars(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
	 
	    if(str.length() < 1) {
	    return null;
	    }
	 
	    return str;
	}
}
