package cn.pms.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Fast;
import cn.pms.pojo.Role;
import cn.pms.pojo.User;
import cn.pms.service.FastService;
import cn.pms.service.RoleService;
import cn.pms.service.UserService;
import cn.pms.service.UserAndRoleService;
import cn.pms.serviceImpl.UserServiceImpl;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private FastService fastService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserAndRoleService userAndRoleService;
	//登陆提交
	@RequestMapping("/login")
	public ModelAndView loginsubmit(HttpSession session,User user)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User currentUser = userService.findUserLogin(user);
		if(currentUser!=null)
		{   //通过查询用户表 user 
			//向session记录当前登录员工编号
			ArrayList<Integer> role = userAndRoleService.findUserRole(currentUser.getId());
			String uRole = "";
			if(role.size() > 0) {
				for(Integer i : role) {
					if(i == 6) {
						modelAndView.addObject("msg", "您没有权限登录");
						modelAndView.setViewName("login");
						return modelAndView;
					}
					 
					Role r = roleService.updateRoleById(i);
					uRole += r.getRoleName();
				}
				ArrayList<String> userRole = new ArrayList<String>();
				userRole.add(uRole);
				session.setAttribute("currentUser", currentUser);
				session.setAttribute("fastAll", fastService.selectAllFast());
				session.setAttribute("userRole", userRole);
				modelAndView.setViewName("index");
			} else {
				modelAndView.addObject("msg", "您没有权限登录");
				modelAndView.setViewName("login");
			}
		}else{
			modelAndView.addObject("msg", "账号或密码错误");
			modelAndView.setViewName("login");
		}
		return modelAndView;
	}
	//退出
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		//session过期
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("/findFast")
	@ResponseBody
	public List<Fast> findFast() {
		return fastService.selectAllFast();
	}
	
}
