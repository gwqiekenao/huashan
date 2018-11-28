package cn.pms.mapper.xitong;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.File;
import cn.pms.pojo.PageModel;

public interface FileMapper {
	public int getCount(@Param("userName")String userName);
	public ArrayList<File> findFile(@Param("pageModel")PageModel pageModel,@Param("userName")String userName);
	public int delFile(@Param("id")int id);
	public int insertFile(File file);
}