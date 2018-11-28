package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;
import cn.pms.service.ProjectService;
import cn.pms.mapper.caigou.ProjectMapper;
@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectMapper projectMapper;
	
	@Override
	public int getCount(String projectCode, String projectName) {
		return projectMapper.getCount(projectCode,projectName);
	}

	@Override
	public ArrayList<Project> findProject(PageModel pageModel, String projectCode, String projectName) {
		return projectMapper.findProject(pageModel,projectCode,projectName);
	}
	
	public Project findProById(int id) {
		return projectMapper.findProById(id);
	}

	@Override
	public void updateProject(Project project) {
		projectMapper.updateProject(project);
	}

	@Override
	public int deletePro(String[] codes) {
		return projectMapper.deletePro(codes);
	}

	@Override
	public void insertProject(Project project) {
		projectMapper.insertProject(project);
	}

	@Override
	public Project findProByCode(String projectCode) {
		return projectMapper.findProByCode(projectCode);
	}

	@Override
	public ArrayList<Project> findAllProject() {
		return projectMapper.findAllProject();
	}
	
}
