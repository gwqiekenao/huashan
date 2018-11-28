package cn.pms.mapper.caigou;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;


public interface ProjectMapper {
	public int getCount(@Param("projectCode")String projectCode, @Param("projectName")String projectName);
	
	public ArrayList<Project> findProject(@Param("pageModel")PageModel pageModel,
			@Param("projectCode")String projectCode, @Param("projectName")String projectName);
	
	public Project findProById(@Param("id")int id);
	
	public void updateProject(Project project);
	
	public int deletePro(@Param("codes")String[] codes);
	
	public void insertProject(Project project);
	
	public Project findProByCode(@Param("projectCode")String projectCode);
	
	public ArrayList<Project> findAllProject();
}