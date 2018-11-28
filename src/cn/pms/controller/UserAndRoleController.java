package cn.pms.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Role;
import cn.pms.pojo.User;
import cn.pms.pojo.Userandrole;
import cn.pms.service.RoleService;
import cn.pms.service.UserAndRoleService;
import cn.pms.service.UserService;

@Controller
@RequestMapping("/userAndRoleController")
public class UserAndRoleController {
 
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserAndRoleService userAndRoleService;
	//授权跳转页面
		@RequestMapping("/jump")
		public ModelAndView jump(String id)  throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			 
			User user = userService.updateUserByIdss(id);//查询需要授权用户的信息
			ArrayList<Role> userNameList = roleService.findAllByName();//查询角色名称信息
			ArrayList<Userandrole> userandroleList  = userAndRoleService.findAllURId(user.getId()); //查询有哪些权限		 
			modelAndView.addObject("userNameList", userNameList);//将信息传到前台
			modelAndView.addObject("userandroleList", userandroleList);			 
			modelAndView.addObject("user", user); 
			modelAndView.setViewName("xitong/xtgl_rywh_jump");
			return modelAndView;
		}
	// 增加
	@RequestMapping("insertPro")
	public ModelAndView insertPro(Userandrole userandrole) throws Exception {		 
		if(userandrole.getRoleId() == 1){
			userAndRoleService.deleteCondition(userandrole.getUserId()); 
		}
		ModelAndView modelAndView = new ModelAndView();
		userAndRoleService.insertUserAndRole(userandrole);//从前台获取数据添加到数据库
		modelAndView.setViewName("redirect:/userController/findAllUser");
		return modelAndView;
	}
	
	//根据条件删除
	@RequestMapping("/deleteUserAndRole")
	public ModelAndView deleteUserAndRole(Userandrole userandrole) throws Exception{		 
	 	  
	 ModelAndView modelAndView = new ModelAndView();
	 userAndRoleService.deleteUserAndRole(userandrole);
	 modelAndView.setViewName("redirect:/userController/findAllUser");
	 return modelAndView;
	}
}
