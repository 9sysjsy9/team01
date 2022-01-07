package com.kh.ex01.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class MyFileUploadUtil {
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(uploadPath);
		String filePath = datePath + "/" + uuid + "_" + originalName;
		File target = new File(filePath);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filePath;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String dateString = year + "/" + month + "/" + date;
		String datePath = uploadPath + "/" + dateString; 
		System.out.println("MyFileUploadUtil, datePath: "+datePath);
		
		File f = new File(datePath);
		
		if (!f.exists()) {
			f.mkdirs();
			System.out.println("MyFileUploadUtil에서 파일 생성됨");
		}

		return datePath;
	}

	public static boolean makeThumbnail(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, front: "+front);
		String rear = filePath.substring(slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, rear: "+rear);
		String thumbnailPath = front + "sm_" + rear;
		
		File orgFile = new File(filePath);
		System.out.println("MyFileUploadUtil, orgFile:"+orgFile);
		File thumbFile = new File(thumbnailPath);
		System.out.println("MyFileUploadUtil, thumbFile:"+ thumbnailPath);
		
		try {
			BufferedImage srcImage = ImageIO.read(orgFile);
			BufferedImage descImage =
					Scalr.resize(srcImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
			ImageIO.write(descImage, getExtName(filePath), thumbFile);
			System.out.println("MyFileUploadUtil, makeThumbnail try구문 실행됨");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	private static String getExtName(String fileName) {
		// uuid_name.jpg -> JPG
		int dotIndex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotIndex + 1);
		return extName.toUpperCase();
	}
	
	public static boolean isImage(String fileName) {
		String extName = getExtName(fileName);
		if (extName.equals("JPG") || extName.equals("PNG") || extName.equals("GIF")) {
			return true;
		}
		return false;
	}
	
	public static String getThumbnailPath(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String thumbnailPath = front + "sm_" + rear;
		return thumbnailPath;
	}
	
}
