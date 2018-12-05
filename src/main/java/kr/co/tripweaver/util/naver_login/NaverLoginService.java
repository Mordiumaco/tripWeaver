package kr.co.tripweaver.util.naver_login;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

/**
* NaverLoginService.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 11. 29.
* @see
* 
* << 클래스 생성 목적 >>
* 해당 클래스는 네이버의 로그인 로직을 처리하기 위한 
* 클래스 입니다.
* 
*
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@Service
public class NaverLoginService {
	
	Logger logger = LoggerFactory.getLogger(NaverLoginService.class);
	
	/**
	* Method : NaverLoginAccessToken
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param request
	* @return
	* @throws UnsupportedEncodingException
	* Method 설명 : 네이버에게 엑세스 토큰을 요청하는 메서드 
	* 이 메서드를 통해 엑세스 토큰(자료 요청 토큰)을 받을 수 있다. 
	* 
	*/
	public String NaverLoginAccessToken(HttpServletRequest request) throws UnsupportedEncodingException {
		StringBuffer res = new StringBuffer();
		String clientId = "hAi60RWrlDCU1L3kMH90";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "ZiJQLHBcOK";//애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("test/getInfo", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL="+apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode="+responseCode);
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if(responseCode==200) {
				System.out.println(res.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		//네이버로부터 받은 JSON 문자열에서 데이터를 받는다 
		//GSON 라이브러리를 사용 (JSON 데이터 파서 라이브러리)
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonElement element =  parser.parse(res.toString());
		access_token = element.getAsJsonObject().get("access_token").getAsString();
		
		return access_token;
	}
	
	
	
	/**
	* Method : getNaverUserInfo
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 11. 29.
	* 변경이력 :
	* @param access_token
	* @return
	* Method 설명 : 받은 토큰(정보를 얻을 수 있는 권한)을 가지고 네이버에게 토큰을 준 후 
	* 이를 해당 회원의 정보를 받아올 수 있다! 
	* 받아올 수 있는 정보는 총 8가지 정도
	* age, profile, name, nickname, birthday, gender , id(고유 64bit 숫자로 이루어짐), email
	* 
	* 
	*/
	public Map<String, String> getNaverUserInfo(String access_token){
		
		String token = access_token;
		System.out.println("token : "+token);
		
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        StringBuffer response = new StringBuffer();
        try {
            String apiURL2 = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL2);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
           
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
        
        //네이버로부터 받은 JSON 문자열에서 데이터를 받는다 
      	//GSON 라이브러리를 사용 (JSON 데이터 파서 라이브러리)
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        JsonElement element =  parser.parse(response.toString());
        Object naverResponse = element.getAsJsonObject().get("response").getAsJsonObject();
        
        logger.debug("네이버에서 주는 값 : "+naverResponse);
        
        //Key 값 = age, profile_image, name, nickname, birthday, gender , id(고유 64bit 숫자로 이루어짐), email
        Map<String, String> userInfoMap = gson.fromJson(naverResponse.toString(), Map.class);
        
        //네이버 유저의 맵객체를 넘긴다. 
        return userInfoMap;
	}
	
	
	
}
