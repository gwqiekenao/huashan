package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;

public interface ProjectService {
	
	public int getCount(String projectCode, String projectName);
	
	public ArrayList<Project> findProject(PageModel pageModel,String projectCode, String projectName);
	
	public Project findProById(int id);
	
	public void updateProject(Project project);
	
	public int deletePro(String[] codes);
	
	public void insertProject(Project project);
	
	public Project findProByCode(String projectCode);
	
	public ArrayList<Project> findAllProject();
}
