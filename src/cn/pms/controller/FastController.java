package cn.pms.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;
import cn.pms.service.FastService;

@Controller
@RequestMapping("/fastController")
public class FastController {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private FastService fastService;

	// 查询所有模糊查询
	// 查询所有模糊查询
	@RequestMapping("/findAllFast")
	public String findAllFast(@RequestParam(value = "nowPageNum", required = false) String nowPageNum, // 当前页数
			@RequestParam(value = "eachPageNum", required = false) String eachPageNum,
			@RequestParam(value = "code", required = false) String code, // 根据编号查询
			@RequestParam(value = "codeName", required = false) String codeName, // 根据编号名称查询
			@RequestParam(value = "fastTypeName", required = false) String fastTypeName) throws Exception {
		int nowPage;
		int eachPNum;

		if (nowPageNum == null || nowPageNum == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(nowPageNum);
		}
		if (eachPageNum == null || eachPageNum == "") {
			eachPNum = 5;
		} else {
			eachPNum = Integer.parseInt(eachPageNum);
		}
		int fastFormCount = fastService.getCount(code, codeName, fastTypeName);
		PageModel pageModel = new PageModel(eachPNum, fastFormCount, nowPage);
		ArrayList<Fast> fastTypes = fastService.findFast();
		//删除相同的选项
		for (int x = 0; x < fastTypes.size() - 1; x++) {
			for (int y = 0; y < fastTypes.size() - 1; y++) {
				if (fastTypes.get(y).equals(fastTypes.get(x))) {
					fastTypes.remove(x);
					fastTypes.remove(y);
				}
			}
		}
		ArrayList<Fast> fastList = fastService.findFastForm(pageModel, nowPage, code, codeName, fastTypeName);
		request.setAttribute("pageModel", pageModel);
		if (fastList != null) {
			request.setAttribute("fastList", fastList);
		}
		request.setAttribute("fastTypes", fastTypes);
		request.setAttribute("code", code);
		request.setAttribute("codeName", codeName);
		request.setAttribute("fastTypeName", fastTypeName);
		return "xitong/xtgl_ksbm";
	}

	// 获得修改的ID的信息
	@RequestMapping("/update")
	public ModelAndView update(int id) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		Fast fast = fastService.updateById(id);
		modelAndView.addObject("fast", fast);//将查询出来的结果返回到前台
		modelAndView.setViewName("xitong/xtgl_ksbm_update");//转发到前台那个页面
		return modelAndView;
	}

	// 修改
	@RequestMapping("/updatePro")
	public ModelAndView updatePro(Fast fast) throws Exception {
		 
		ModelAndView modelAndView = new ModelAndView();
		 
		fastService.updatePro(fast);//修改信息
		modelAndView.setViewName("redirect:/fastController/findAllFast");//重定项
		return modelAndView;
	}

	// 增加跳转页面
	@RequestMapping("/insertFast")
	public ModelAndView insertFast() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("xitong/xtgl_ksbm_modification");
		return modelAndView;
	}

	// 增加
	@RequestMapping("insertPro")
	public ModelAndView insertPro(Fast fast) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		fastService.insertFast(fast);
		modelAndView.setViewName("redirect:/fastController/findAllFast");
		return modelAndView;
	}

	// 启动
	@RequestMapping("delteFast")
	public ModelAndView deleteFast(String id) throws Exception {
		String[] id1 = { id };
		ModelAndView modelAndView = new ModelAndView();
		fastService.deleteFast(id1);
		modelAndView.setViewName("redirect:/fastController/findAllFast");
		return modelAndView;
	}

	// 禁用
	@RequestMapping("delteFasts")
	public ModelAndView deleteFasts(String id) throws Exception {
		String[] id1 = { id };
		ModelAndView modelAndView = new ModelAndView();
		fastService.deleteFasts(id1);
		modelAndView.setViewName("redirect:/fastController/findAllFast");
		return modelAndView;
	}

	// 批量启用
	@RequestMapping("/deleteFastsss")
	public ModelAndView deleteFastsss(String idss) throws Exception {
		//创建数组
		String[] id1 = idss.split(",");
		//model模型
		ModelAndView modelAndView = new ModelAndView();
		String code = "";//
		for (int x = 0; x < id1.length; x++) {//遍历数组
			code = (id1[x]);//变换类型
			fastService.deleteFastsss(code);//将遍历出来的数一个个的传到数据库操作类中删除
		}
		modelAndView.setViewName("redirect:/fastController/findAllFast");
		return modelAndView;
	}

	// 批量删除
	@RequestMapping("/deleteFastss")
	public ModelAndView deleteFastss(String idss) throws Exception {
		String[] id1 = idss.split(",");		
		ModelAndView modelAndView = new ModelAndView();
		String code = "";
		for (int x = 0; x < id1.length; x++) {
			code = (id1[x]);
			fastService.deleteFastss(code);
		}
		modelAndView.setViewName("redirect:/fastController/findAllFast");
		return modelAndView;
	}

	@RequestMapping("/verifyYZ")
	@ResponseBody
	public ArrayList<Fast> verifyYZ(String code) throws Exception {
		ArrayList<Fast> fastCodeList = fastService.finFastYZ(code);

		return fastCodeList;
	}

	// 根据code和codeName来查询信息
	@RequestMapping("/verifyCodeName")
	@ResponseBody
	public ArrayList<Fast> verifyCodeName(String fastType, String code) throws Exception {
		ArrayList<Fast> fastCodeNameList = fastService.finFastCodeName(fastType, code);
		return fastCodeNameList;
	}

	// 根据fastType来查询
	@RequestMapping("/verifyfastType")
	@ResponseBody
	public ArrayList<Fast> verifyfastType(String fastType) throws Exception {
		ArrayList<Fast> fastTypeList = fastService.finFastType(fastType);
		return fastTypeList;
	}

}
