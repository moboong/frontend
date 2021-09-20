package kr.ac.kopo.display.controller;

import java.io.File;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DisplayController {
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		ResponseEntity<byte[]> result = null;

		File file = new File("c:\\Lecture\\maven_work\\wtpwebapps\\Mission-Spring\\upload\\" + fileName);
		File defaultfile = new File("c:\\Lecture\\maven_work\\wtpwebapps\\Mission-Spring\\upload\\profile\\default.png");

		if(file.exists()) {
				
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		} else {
			
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(defaultfile.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(defaultfile), header, HttpStatus.OK);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
}
