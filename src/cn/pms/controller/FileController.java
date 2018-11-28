package cn.pms.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.pms.pojo.File;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.User;
import cn.pms.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	FileService fileService;
	
	@RequestMapping("/findFile")
	@ResponseBody
	public Map<String,Object> findFile(int nowPageNum,int eachPageNum,HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		String userName = ((User)session.getAttribute("currentUser")).getUserName();
		int fileCount = fileService.getCount(userName);
		PageModel pageModel = new PageModel(eachPageNum, fileCount, nowPageNum);
		ArrayList<File> fileList = fileService.findFile(pageModel, userName);
		map.put("pageModel", pageModel);
		map.put("fileList", fileList);
		return map;
	}
	
	@RequestMapping("/delFile")
	@ResponseBody
	public String delFile(int id) {
		fileService.delFile(id);
		return "1";
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(File f,MultipartFile file,HttpSession session) throws Exception {
		if(file != null && file.getSize() > 0) {
			String fName = file.getOriginalFilename();
			String filePath = "D:\\sym_tomcat\\tomcat_pic\\";
			String fileName = UUID.randomUUID() + fName;
			java.io.File newFile = new java.io.File(filePath + fileName);
			file.transferTo(newFile);
			f.setFileName(fileName);
			f.setCreateUser(((User)session.getAttribute("currentUser")).getUserName());
			fileService.insertFile(f);
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/downLoad")
	public ResponseEntity<byte[]> downLoad(String fileName,HttpServletResponse response) throws IOException {
		String name = new String(fileName.getBytes("ISO-8859-1"),"utf-8");
		String filePath = "D:\\sym_tomcat\\tomcat_pic\\" + name;
		HttpHeaders headers = new HttpHeaders();
		java.io.File file = new java.io.File(filePath);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", name);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
				headers, HttpStatus.CREATED);
		return responseEntity;
	}
	
}
