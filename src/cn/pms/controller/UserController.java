package cn.pms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.User;
import cn.pms.service.UserService;

@Controller
@RequestMapping("/userController")
public class UserController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private UserService userService;
	// 查询所有
	@RequestMapping("/findAllUser")
	public String findAllUser(@RequestParam(value = "nowPageNum", required = false) String nowPageNum, // 当前页数
			@RequestParam(value = "eachPageNum", required = false) String eachPageNum,
			@RequestParam(value = "userCode", required = false) String userCode, // 根据1编号模糊查询
			@RequestParam(value = "userName", required = false) String userName, // 根据名称模糊查询
			@RequestParam(value = "userTel", required = false) String userTel) throws Exception {
		// 根据手机号码查询
		int nowPage;
		int eachPNum;
		if (nowPageNum != null && nowPageNum != "") {
			nowPage = Integer.parseInt(nowPageNum);
		} else {
			nowPage = 1;
		}
		if (eachPageNum == null || eachPageNum == "") {
			eachPNum = 5;
		} else {
			eachPNum = Integer.parseInt(eachPageNum);
		}
		if (userCode != null && userCode != "") {

		} else {
			userCode = "";
		}
		int userFormCount = userService.getCount(userCode, userName, userTel);

		PageModel pageModel = new PageModel(eachPNum, userFormCount, nowPage);
		ArrayList<User> userList = userService.findUserForm(pageModel, nowPage, userCode, userName, userTel);
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("userList", userList);
		request.setAttribute("userCode", userCode);
		request.setAttribute("userName", userName);
		request.setAttribute("userTel", userTel);
		return "xitong/xtgl_rywh";
	}

	/*
	 * //修改
	 * 
	 * @RequestMapping("/updateUser") public String updateUser(User user) throws
	 * Exception{ userService.updateUser(user); return "login"; //return
	 * "redirect:/userController/findAllUser"; }
	 */
	// 获取修改id的信息
	@RequestMapping("/update")
	public ModelAndView update(int id) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.updateUserById(id);
		modelAndView.addObject("user", user);
		modelAndView.setViewName("xitong/xtgl_rywh_update");
		return modelAndView;
	}

	// 修改
	@RequestMapping("/updatePro")
	public ModelAndView updatePro(User user) {
		System.out.println(user);
		ModelAndView modelAndView = new ModelAndView();
		userService.updateUser(user);
		modelAndView.setViewName("redirect:/userController/findAllUser");
		return modelAndView;
	}

	// 增加跳转页面
	@RequestMapping("/insertUser")
	public ModelAndView insertUser() {
		ModelAndView modelAndView = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");//生成当前时间作为人员编号
		String userCode = "RYBH" + sdf.format(new Date());
		modelAndView.addObject("userCode", userCode);
		modelAndView.setViewName("xitong/xtgl_rywh_detail");
		return modelAndView;
	}

	// 增加
	@RequestMapping("/insertpro")
	public ModelAndView insertPro(User user) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		userService.insertUser(user);
	 
		modelAndView.setViewName("redirect:/userController/findAllUser");
		return modelAndView;
	}

	// 删除
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(String id) throws Exception {
		String[] id1 = { id };
		ModelAndView modelAndView = new ModelAndView();
		userService.deleteUser(id1);
		modelAndView.setViewName("redirect:/userController/findAllUser");
		return modelAndView;
	}
	//批量删除
	@RequestMapping("/deleteUsers")
	public ModelAndView deleteUsers(String idss) throws Exception {
		String[] userCode1 = idss.split(",");
	
		ModelAndView modelAndView = new ModelAndView();
		String userCode = "";
		for (int x = 0; x < userCode1.length; x++) {
			
			userCode = userCode1[x];
		 
			userService.deleteUsers(userCode);
		}
		modelAndView.setViewName("redirect:/userController/findAllUser");
		return modelAndView;
	}
	
}
