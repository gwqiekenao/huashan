package cn.pms.service;

import java.util.ArrayList;
import cn.pms.pojo.File;
import cn.pms.pojo.PageModel;

public interface FileService {
	public int getCount(String userName);
	public ArrayList<File> findFile(PageModel pageModel,String userName);
	public int delFile(int id);
	public int insertFile(File file);
}
