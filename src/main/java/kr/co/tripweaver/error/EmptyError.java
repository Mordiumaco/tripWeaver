package kr.co.tripweaver.error;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

public class EmptyError implements View{

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
		script.println("alert('빈칸이 존재합니다. 값을 채워주세요');");
		script.println("window.history.back();");
		script.println("</script>");
		script.flush();
		script.close();
	}
	
}
