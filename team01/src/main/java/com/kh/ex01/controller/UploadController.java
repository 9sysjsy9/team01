package com.kh.ex01.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ex01.util.MyFileUploadUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {

	private static final String UPLOAD_PATH = "//192.168.0.234/upload";
	
	@RequestMapping(value = "/download.do", method = RequestMethod.GET)
	@ResponseBody
	public byte[] fileDown(String fileName, HttpServletResponse response) throws Exception{
		System.out.println("download.do, fileName: "+fileName);
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte[] fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(new File(UPLOAD_PATH+fileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(
				MyFileUploadUtil.getShortName(fileName), "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		return fileByte;
	}

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws IOException {
		String originalName = file.getOriginalFilename();
		String filePath = MyFileUploadUtil.uploadFile(UPLOAD_PATH, originalName, file.getBytes());
		System.out.println("UploadController, filePath: " + filePath);

		boolean isImage = MyFileUploadUtil.isImage(filePath);
		System.out.println("isImage: " + isImage);
		if (isImage) {
			boolean result = MyFileUploadUtil.makeThumbnail(filePath);
			if (!result) {
				return "fail";
			}
		}
		return filePath.substring(UPLOAD_PATH.length());
	}

	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		System.out.println("UploadController, displayFile, fileName: " + fileName);
		/*
		 * String thumbnailPath = MyFileUploadUtil.getThumbnailPath(fileName);
		 * System.out.println("UploadController, displayFile, thumbnailPath: "
		 * +thumbnailPath);
		 */
		// FileInputStream fis = new FileInputStream(UPLOAD_PATH+thumbnailPath);
		FileInputStream fis = new FileInputStream(UPLOAD_PATH + fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}

	@RequestMapping(value = "/displayThumbnailImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayThumbnailImage(String fileName) throws Exception {
		System.out.println("UploadController, displayThumbnailImage, fileName: " + fileName);
		String thumbnailPath = MyFileUploadUtil.getThumbnailPath(fileName);
		System.out.println("UploadController, displayThumbnailImage, thumbnailPath: " + thumbnailPath);
		FileInputStream fis = new FileInputStream(UPLOAD_PATH + thumbnailPath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}

	@RequestMapping(value = "/deleteAllFile", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteAllFile(String fileName) throws Exception {
		System.out.println("UploadController, deleteAllFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteAllFile(UPLOAD_PATH + fileName);

		return result;
	}

	@RequestMapping(value = "/deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteFile(String fileName) throws Exception {
		System.out.println("UploadController, deleteFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteFile(UPLOAD_PATH + "/shoes" + fileName);
		return result;
	}

	@RequestMapping(value = "/deleteThumbnailFile", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteThumbnailFile(String fileName) throws Exception {
		System.out.println("UploadController, deleteThumbnailFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteThumbnailFile(UPLOAD_PATH + "/shoes" + fileName);
		return result;
	}

}
