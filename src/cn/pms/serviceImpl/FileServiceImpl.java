package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.xitong.FileMapper;
import cn.pms.pojo.File;
import cn.pms.pojo.PageModel;
import cn.pms.service.FileService;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	FileMapper fileMapper;
	
	@Override
	public int getCount(String userName) {
		return fileMapper.getCount(userName);
	}

	@Override
	public ArrayList<File> findFile(PageModel pageModel,String userName) {
		return fileMapper.findFile(pageModel,userName);
	}

	@Override
	public int delFile(int id) {
		return fileMapper.delFile(id);
	}

	@Override
	public int insertFile(File file) {
		return fileMapper.insertFile(file);
	}

}
