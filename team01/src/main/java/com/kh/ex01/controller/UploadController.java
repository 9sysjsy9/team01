package com.kh.ex01.controller;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ex01.util.MyFileUploadUtil;


@Controller
@RequestMapping("/company")
public class UploadController {
	
	private static final String UPLOAD_PATH = "//E:/upload";

	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, 
			produces = "application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws IOException {
		System.out.println("file: " + file);
		String originalName = file.getOriginalFilename();
		System.out.println("originalName: " + originalName);
		String filePath = 
				MyFileUploadUtil.uploadFile(UPLOAD_PATH, originalName, file.getBytes());
		System.out.println("filePath: "+ filePath);
		boolean isImage = MyFileUploadUtil.isImage(filePath);
		System.out.println("isImage: "+isImage);
		
		if (isImage) {
			boolean result = MyFileUploadUtil.makeThumbnail(filePath);
			if (!result) {
				return "fail";
			}
		}
		
		return filePath.substring(UPLOAD_PATH.length());
	}
	
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public void displayImage(String fileName) throws Exception {
		System.out.println("UploadController, displayFile, fileName: " + fileName);
	}
	
}
