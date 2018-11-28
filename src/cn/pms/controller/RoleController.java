package cn.pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Role;
import cn.pms.service.RoleService;

@Controller
@RequestMapping("/roleController")
public class RoleController {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private RoleService roleService;
	//查询所有,模糊查询分页
	@RequestMapping("/findAllRole")
	public String findAllRole(@RequestParam(value = "nowPageNum", required = false) String nowPageNum,
			@RequestParam(value = "eachPageNum", required = false)String eachPageNum,
			@RequestParam(value = "roleName", required = false) String roleName ) throws Exception {
		 
		int nowPage;
		int eachPNum;
		if (nowPageNum != null && nowPageNum != "") {
			nowPage = Integer.parseInt(nowPageNum);
		} else {
			nowPage = 1;
		}
		if(eachPageNum == null || eachPageNum == "") {
			eachPNum = 5;
		} else {
			eachPNum = Integer.parseInt(eachPageNum);
		}
	 
		int roleFormCount = roleService.getCount(roleName);
	 
		PageModel pageModel = new PageModel(eachPNum, roleFormCount, nowPage);
		ArrayList<Role> roleList = roleService.findRoleForm(pageModel, nowPage, roleName);
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("roleList", roleList);		 
		request.setAttribute("roleName", roleName); 
		return "xitong/xtgl_jswh";
	}
	
	//获取修改Id的信息,然后根据这些信息来修改
	@RequestMapping("/updateById")
	public ModelAndView updateById(int id) throws Exception{
		 //模型
		ModelAndView modelAndView = new ModelAndView();
		Role role = roleService.updateRoleById(id);
		modelAndView.addObject("role" , role);
		modelAndView.setViewName("xitong/xtgl_jswh_update_");
		return modelAndView;		
	}
	
	//修改信息
	@RequestMapping("updateAllRole")
	public ModelAndView updateAllRole(Role role) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		roleService.updateRole(role);
		modelAndView.setViewName("redirect:/roleController/findAllRole");
		return modelAndView;		
	}
	//增加跳转页面
	@RequestMapping("/insertRole")
	public ModelAndView insertRole(){
	ModelAndView  modelAndView = new ModelAndView();
	modelAndView.setViewName("xitong/xtgl_jswh_insert");
	return modelAndView;
	}
	//增加
	@RequestMapping("insertRoleAll")
	public ModelAndView insertRoleAll(Role role) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		roleService.insertRole(role);
		modelAndView.setViewName("redirect:/roleController/findAllRole");
		return modelAndView;		
	}
	
	//单个删除
	 @RequestMapping("deleteRole")
	 public ModelAndView deleteRole(String id) throws Exception{		 
		 ModelAndView modelAndView = new ModelAndView();//模型
		 roleService.deleteRole(id);
		 modelAndView.setViewName("redirect:/roleController/findAllRole");
		return modelAndView;		 
	 }
	 
	 //批量删除
	 @RequestMapping("/deleteRoles")
	 public ModelAndView deleteRoles(String idss) throws Exception{
		 String[] id1 = idss.split(",");
	 
 
		 ModelAndView modelAndView = new ModelAndView();
		 String roleName = "";
		 for(int x = 0; x < id1.length; x++){
			 roleName = (id1[x]);
			 roleService.deleteRoles(roleName);
		 }
		 modelAndView.setViewName("redirect:/roleController/findAllRole");
		 return modelAndView;
	 }
	//授权跳转页面
	/*	@RequestMapping("/jump")
		public ModelAndView jump(int id)  throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			User user = userService.updateUserById(id);
			modelAndView.addObject("user", user); 
			modelAndView.setViewName("xitong/xtgl_rywh_jump");
			return modelAndView;
		}*/
	
}
