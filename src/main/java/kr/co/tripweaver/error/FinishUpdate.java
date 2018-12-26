package kr.co.tripweaver.error;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

/**
* FinishUpdate.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 24.
* @see
* 
* << 클래스 생성 목적 >>
* 
* 해당 정보가 정상적으로 업데이트가 되었는지 알려주는 뷰 
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
public class FinishUpdate implements View{
	
	@Override
	public String getContentType() {
		return null;
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('정상적으로 해당 정보가 처리되었습니다.');");
		script.println("location.href = '/main/main';");
		script.println("</script>");
		script.flush();
		script.close();
	}
}