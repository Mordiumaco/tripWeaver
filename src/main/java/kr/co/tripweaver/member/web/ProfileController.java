package kr.co.tripweaver.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("file")
@Controller
public class ProfileController {
	
	private final String PATH = "C:\\upload\\";
	
	@RequestMapping("read")
	public void read(@RequestParam("mem_profile") String mem_profile, HttpServletResponse response) throws IOException {

		File f = new File(PATH + mem_profile);
		FileInputStream fis = new FileInputStream(f);

		byte[] buffer = new byte[512];
		int len = 0;

		ServletOutputStream sos = response.getOutputStream();// response에 쓰면 된다.

		// 파일 읽기
		while ((len = fis.read(buffer)) != -1) {
			// 파일 쓰기(response에 쓰면 된다.)
			sos.write(buffer, 0, len);
		}
		sos.flush();
		sos.close();
		fis.close();
	}
}
