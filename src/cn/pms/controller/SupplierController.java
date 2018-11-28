package cn.pms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Fast;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;
import cn.pms.pojo.Supplier;
import cn.pms.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Autowired
	SupplierService supplierService;
	
	@RequestMapping("/findSupp")
	public String findSupp() {
		return "hetong/xtgl_gyssj";
	}
	
	@RequestMapping("/findSupplier")
	@ResponseBody
	public Map<String, Object> findSupplier(String supplierCode,String supplierName,
			String supplierType,String nowPageNum,String eachPageNum,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		 
		int nowPage = Integer.parseInt(nowPageNum);
		int eachPNum = Integer.parseInt(eachPageNum);
		List<Fast> fastList = (List<Fast>)session.getAttribute("fastAll");
		int supplierCount = supplierService.getCount(supplierCode, supplierName, supplierType);
		PageModel pageModel = new PageModel(eachPNum, supplierCount, nowPage);
		ArrayList<Supplier> supplierList = supplierService.findSupplier(pageModel, supplierCode, 
				supplierName, supplierType);
		map.put("pageModel", pageModel);
		map.put("supplierList", supplierList);
		map.put("fastList", fastList);
		return map;
	}
	
	@RequestMapping("/supplierDetail")
	public ModelAndView  supplierDetail(String supplierCode) {
		ModelAndView modelAndView = new ModelAndView();
		Supplier supplier = supplierService.findSupByCode(supplierCode);
		modelAndView.addObject("supplier",supplier);
		modelAndView.setViewName("hetong/xtgl_gyssj_detail");
		return modelAndView;
	}
	
	@RequestMapping("/deleteSupp")
	@ResponseBody
	public String deleteSupp(String supplierCodes) {
		String[] codes = supplierCodes.split(",");
		String flag = "2";
		int n = supplierService.deleteSupplier(codes);
		if(n == codes.length) {
			flag = "1";
		}
		return flag;
	}
	
	@RequestMapping("/updateSupp")
	public ModelAndView  updateSupp(String supplierCode) {
		ModelAndView modelAndView = new ModelAndView();
		Supplier supplier = supplierService.findSupByCode(supplierCode);
		modelAndView.addObject("supplier",supplier);
		modelAndView.setViewName("hetong/xtgl_gyssj_modification");
		return modelAndView;
	}
	
	@RequestMapping("/updateSupplier")
	public ModelAndView  updateSupplier(Supplier supplier) {
		ModelAndView modelAndView = new ModelAndView();
		supplierService.updateSupplier(supplier);
		modelAndView.addObject("msg","修改成功");
		modelAndView.setViewName("hetong/xtgl_gyssj");
		return modelAndView;
	}
	
	@RequestMapping("/addSupplier")
	public ModelAndView  addSupplier(Supplier supplier) {
		ModelAndView modelAndView = new ModelAndView();
		supplierService.insertSupplier(supplier);
		modelAndView.addObject("msg","增加成功");
		modelAndView.setViewName("hetong/xtgl_gyssj");
		return modelAndView;
	}
	
	@RequestMapping("/addSupp")
	public ModelAndView  addSupp() {
		ModelAndView modelAndView = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String supplierCode = "GYBH" + sdf.format(new Date());
		modelAndView.addObject("supplierCode",supplierCode);
		modelAndView.setViewName("hetong/xtgl_gyssj_add");
		return modelAndView;
	}
}
