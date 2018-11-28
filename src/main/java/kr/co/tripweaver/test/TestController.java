package kr.co.tripweaver.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@RequestMapping("test")
@Controller
public class TestController {
	

	@RequestMapping("/login")
	public String login_View() {
		
		return "test/login";
		
	}
	
	@RequestMapping("/callback")
	public String callBack_View(HttpServletRequest request) throws UnsupportedEncodingException {
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
		
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonElement element =  parser.parse(res.toString());
		access_token = element.getAsJsonObject().get("access_token").getAsString();

		System.out.println("access : "+access_token);
		
		request.getSession().setAttribute("access_token", access_token);
		
		
		//-------------------------------------------------------------------
		
		
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
        
        Gson gson2 = new Gson();
        JsonParser parser2 = new JsonParser();
        JsonElement element2 =  parser2.parse(response.toString());
        Object naverResponse = element2.getAsJsonObject().get("response").getAsJsonObject();
        
        System.out.println(naverResponse);
        
        Map<String, String> map = gson.fromJson(naverResponse.toString(), Map.class);
       
        for(String str : map.keySet()) {
        	
        	String value = map.get(str);
        	System.out.println(str+" : "+value);
        	
        }
        
		
		return "test/callback";
	}
	
	@RequestMapping("/test")
	public String test_View(HttpServletRequest request) {
		String token = (String)request.getAttribute("access_token");
		System.out.println(token);
		
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        StringBuffer response = new StringBuffer();
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
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
        
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        JsonElement element =  parser.parse(response.toString());
        Object naverResponse = element.getAsJsonObject().get("response").getAsJsonObject();
        
        System.out.println(naverResponse);
        
        Map<String, String> map = gson.fromJson(naverResponse.toString(), Map.class);
       
        for(String str : map.keySet()) {
        	
        	String value = map.get(str);
        	System.out.println(str+" : "+value);
        	
        }
        
        
   /*     JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(response.toString());
        
        element = element.getAsJsonObject().get("response");*/
        	
        /* 네이버가 주는 값 하나씩 받기  */
        //String name = element.getAsJsonObject().get("response").getAsJsonObject().get("name").getAsString();
        //System.out.println(name);
        
        
		return "test/test";
	}
}
