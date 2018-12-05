package kr.co.tripweaver.error;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

public class JoinCheckError implements View{
	
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
		script.println("alert('이미 존재하는 회원입니다. 다시 가입해주세요.');");
		script.println("location.href = '/main/main';");
		script.println("</script>");
		script.flush();
		script.close();
	}
}
