package kr.co.tripweaver.util.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {

	@RequestMapping("/fileS")
	public void fildDownload(@RequestParam("file") String fileName, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		String directory = FilePath.PATH;
		File file = new File(directory+"/"+fileName);
		
		String mimeType = request.getServletContext().getMimeType(file.toString());
		
		if(mimeType == null){
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
		
		if(request.getHeader("user-agent").indexOf("MSIE") == -1){
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}else{
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;fileName=\""+downloadName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while ((data = (fileInputStream.read(b,0,b.length))) != -1){
			servletOutputStream.write(b, 0, data);
			
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}
}
