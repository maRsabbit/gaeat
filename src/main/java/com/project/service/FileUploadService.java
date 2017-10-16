package com.project.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public String restore(MultipartFile file,String email) {

		String saveDir = "C:\\A\\"+email+"\\";
		//폴더생성
		File crateD = new File(saveDir);
		if (!crateD.exists()) {
			crateD.mkdirs();
		}


		// 원래 파일 이름
		String orgName = file.getOriginalFilename();// 파일의 원래 이름
		System.out.println("orgName: " + orgName);

		// 확장자 이름
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));// 숫자에 따라 순번에
																											// 따라 잘라주는 수
		System.out.println("exName: " + exName);

		// 파일 사이즈

		long filesize = file.getSize();

		System.out.println("filesize: " + filesize);

		// 저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName: " + saveName);

		// 파일패스
		String filePath = saveDir + saveName;
		System.out.println(filePath);

		// 파일 카피(디렉토리에 복사)-여기에 파일 저장
		
		try {
			byte[] fileData = file.getBytes(); // 아직 메모리에 있음(fileoutputstream사용 필요)
			
			OutputStream out = new FileOutputStream(filePath);// filePath의 주소에 쓰라는 정보
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);
			bout.flush();
			if(bout!=null) {
				bout.close();
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
			

		return saveName;
	}

}
