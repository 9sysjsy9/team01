package com.kh.ex01.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
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

	public static boolean makeThumbnail(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, front: " + front);
		String rear = filePath.substring(slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, rear: " + rear);
		String thumbnailPath = front + "sm_" + rear;

		File orgFile = new File(filePath);
		System.out.println("MyFileUploadUtil, orgFile:" + orgFile);
		File thumbFile = new File(thumbnailPath);
		System.out.println("MyFileUploadUtil, thumbFile:" + thumbnailPath);

		try {
			BufferedImage srcImage = ImageIO.read(orgFile);
			BufferedImage descImage = Scalr.resize(srcImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 75);
			ImageIO.write(descImage, getExtName(filePath), thumbFile);
			System.out.println("MyFileUploadUtil, makeThumbnail try구문 실행됨");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean deleteAllFile(String fileName) throws Exception {
		File f = new File(fileName);
		if (f.exists()) {
			f.delete();
			System.out.println("원본 파일 삭제됨.");

			if (isImage(fileName)) {
				String thumbnailPath = getThumbnailPath(fileName);
				System.out.println(thumbnailPath);
				File f2 = new File(thumbnailPath);
				if (f2.exists()) {
					f2.delete();
					/*
					while (true) {
						boolean b = f2.delete();
						if (b == true) {
							System.out.println("썸네일 파일 삭제됨.");
							return true;
						}
						Thread.sleep(500);
						
					}
					*/
				}
				
			}
			return true;
		}
		return false;
	}

	public static boolean deleteFile(String fileName) throws Exception {
		File f = new File(fileName);
		if (f.exists()) {
			f.delete();
			System.out.println("원본 파일 삭제됨.");
			return true;
		}
		return false;
	}

	public static boolean deleteThumbnailFile(String fileName) throws Exception {
		if (isImage(fileName)) {
			String thumbnailPath = getThumbnailPath(fileName);
			System.out.println("deleteThumbnailFile: "+thumbnailPath);
			File f2 = new File(thumbnailPath);
			if (f2.exists()) {
				/*
				while (true) {
					boolean b = f2.delete();
					if (b == true) {
						System.out.println("썸네일 파일 삭제됨.");
					}
					Thread.sleep(500);
				}
				*/
			}
			return true;
		}
		return false;
	}

	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);

		String dateString = year + "/" + month + "/" + date;
		String datePath = uploadPath + "/shoes/" + dateString;
		System.out.println("MyFileUploadUtil, datePath: " + datePath);

		File f = new File(datePath);

		if (!f.exists()) {
			f.mkdirs();
			System.out.println("MyFileUploadUtil에서 폴더 디렉토리 생성됨");
		}

		return datePath;
	}

	public static String getExtName(String fileName) {
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

	public static String getShortName(String filename) {
		int underIndex = filename.lastIndexOf("_");
		String shortName = filename.substring(underIndex + 1);
		return shortName;
	}

	public static String getThumbnailPath(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String thumbnailPath = front + "sm_" + rear;
		return thumbnailPath;
	}
//프로필 사진 업로드 
	
	public static String uploadProfileImg(String uploadPath, String originalName, int eno, byte[] fileData) {
		String filePath = uploadPath + "/" + eno + "."+getExtName(originalName);
		File target = new File(filePath);
		System.out.println("filePath :" + filePath);
		System.out.println("target :" + target);
		
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filePath;
	}
	
	public static boolean makeSampleProfileImg(String filePath) {
		// //192.168.0.234/upload/profile/test01.JPG
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, front: "+front);
		String rear = filePath.substring(slashIndex + 1);
		System.out.println("MyFileUploadUtil, makeThumbnail, rear: "+rear);
		String samplePath = front + "sample_" + rear;
		
		File orgFile = new File(filePath);
		System.out.println("MyFileUploadUtil, orgFile:"+orgFile);
		File sampleFile = new File(samplePath);
		System.out.println("MyFileUploadUtil, sampleFile:"+ sampleFile);
//		InputStream srcStream = null;
//		BufferedImage srcImage = null;
//		OutputStream descStream = null;
//		BufferedImage descImage = null;
		try {
			InputStream srcStream = new FileInputStream(orgFile);
			BufferedImage srcImage = ImageIO.read(srcStream);
			OutputStream descStream = new FileOutputStream(sampleFile);
			BufferedImage descImage = Scalr.resize(srcImage, 350, 450, null);
			ImageIO.write(descImage, getExtName(filePath), descStream);
			System.out.println("MyFileUploadUtil, makeSampleProfileImg try구문 실행됨");
			srcStream.close();
			descStream.close();
			orgFile.delete();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getSamplePath(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String samplePath = front + "sample_" + rear;
		return samplePath;
	}
	
	public static boolean profileImgChange(String uploadPath, int eno, String extName) {
		File sampleFilePath = new File(uploadPath +"/sample_"+ eno +"." + extName);
		File profileFilePath = null;
		
		if(sampleFilePath.exists() == true) {
			profileFilePath = new File(uploadPath +"/profile_"+ eno +"." + extName);
			
			sampleFilePath.renameTo(profileFilePath);

//			try {
//				Files.copy(sampleFilePath.toPath(), profileFilePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
//				System.out.println("성공");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			sampleFilePath.delete();
			return true;
		}
		System.out.println("MyFileUploadUtil profileImgChange, sampleFilePath : " + sampleFilePath);
		System.out.println("MyFileUploadUtil profileImgChange, profileFilePath : " + profileFilePath);
		System.out.println("실패");
		return false;
	}

}
