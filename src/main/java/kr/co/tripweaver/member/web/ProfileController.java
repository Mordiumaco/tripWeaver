package kr.co.tripweaver.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tripweaver.util.file.FilePath;

@RequestMapping("file")
@Controller
public class ProfileController {
	
	@RequestMapping("read")
	public void read(@RequestParam("file") String file, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//톰캣경로가 아니라 java프로젝트 경로
		String path = FilePath.PATH;
		
		File f = new File(path + file);
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
