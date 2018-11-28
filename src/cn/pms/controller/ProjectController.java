package cn.pms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;
import cn.pms.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/findProject")
	public String findProject() {
		return "caigou/cggl_xmxx";
	}
	
	@RequestMapping("/findPro")
	@ResponseBody
	public Map<String,Object> findPro(
			String nowPageNum,
			String eachPageNum,
			String projectCode,
			String projectName,HttpSession session)
			throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Fast> fastList = (List<Fast>)session.getAttribute("fastAll");
		int	nowPage = Integer.parseInt(nowPageNum);
		int	eachPNum = Integer.parseInt(eachPageNum);
		int projectCount = projectService.getCount(projectCode,projectName);
		PageModel pageModel = new PageModel(eachPNum, projectCount, nowPage);
		ArrayList<Project> projectList = projectService.findProject(
				pageModel, projectCode, projectName);
		map.put("pageModel", pageModel);
		map.put("projectList", projectList);
		map.put("fastList", fastList);
		return map;
	}
	
	@RequestMapping("/proDetail")
	public ModelAndView  proDetail(String projectCode,int flag,@RequestParam(value="id",required=false)String id) {
		ModelAndView modelAndView = new ModelAndView();
		Project project = projectService.findProByCode(projectCode);
		if(id != null && id != "") {
			modelAndView.addObject("id", id);
		}
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("project",project);
		modelAndView.setViewName("caigou/cggl_xmxx_detail");
		return modelAndView;
	}
	
	@RequestMapping("/update")
	public ModelAndView  update(int id) {
		ModelAndView modelAndView = new ModelAndView();
		Project project = projectService.findProById(id);
		modelAndView.addObject("project",project);
		modelAndView.setViewName("caigou/cggl_xmxx_modification");
		return modelAndView;
	}
	
	@RequestMapping("/updatePro")
	public ModelAndView  updatePro(Project project) {
		ModelAndView modelAndView = new ModelAndView();
		projectService.updateProject(project);
		modelAndView.addObject("msg", "修改成功");
		modelAndView.setViewName("caigou/cggl_xmxx");
		return modelAndView;
	}
	
	@RequestMapping("/deletePros")
	@ResponseBody
	public String deletePros(String projectCodes) {
		String[] codes = projectCodes.split(",");
		int n = projectService.deletePro(codes);
		String flag = "2";
		if(n == codes.length) {
			flag = "1";
		}
		return flag;
	}
	
	@RequestMapping("/insertPro")
	public ModelAndView  insertPro(Project project) {
		ModelAndView modelAndView = new ModelAndView();
		projectService.insertProject(project);
		modelAndView.addObject("msg", "增加成功");
		modelAndView.setViewName("caigou/cggl_xmxx");
		return modelAndView;
	}
	
	@RequestMapping("/insert")
	public ModelAndView  insert() {
		ModelAndView modelAndView = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String projectCode = "XMBH" + sdf.format(new Date());
		modelAndView.addObject("projectCode",projectCode);
		modelAndView.setViewName("caigou/cggl_xmxx_add");
		return modelAndView;
	}
	
}
