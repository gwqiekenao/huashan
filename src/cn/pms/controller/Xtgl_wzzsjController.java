package cn.pms.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Delayed;

import javax.servlet.http.HttpSession;
import javax.sound.sampled.LineListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pms.pojo.DateConveter;
import cn.pms.pojo.Fast;
import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.QueryVo;
import cn.pms.service.Xtgl_wzzsjService;


@Controller
public class Xtgl_wzzsjController {
	
	@Autowired
	private Xtgl_wzzsjService xtgl_wzzsjService;
	
	//返回主页数据
	@RequestMapping(value="/xtgl_wzzsj")
	public @ResponseBody Map<String, Object> materialList(QueryVo vo,HttpSession session){
		//查询物质分页对象
		Page<Material> materialList = xtgl_wzzsjService.queryMaterialList(vo);
		List<Fast> fastAll = (List<Fast>) session.getAttribute("fastAll");
		Map map = new HashMap<>();
		
		map.put("fastAll", fastAll);
		map.put("materialList", materialList);
		return map;
	}
	
	//修改页面
	@RequestMapping(value="/xtgl_wzzsj/materialModify")
	public String materialModify(Integer id,Model model){
		//通过id查找物资
		Material materialInfo = xtgl_wzzsjService.queryMaterialById(id);
		//获得数据库时间,转换为String
		Date stratTime1 = materialInfo.getStratTime();
		Date endTime1 = materialInfo.getEndTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String stratTime = sdf.format(stratTime1);
		String endTime = sdf.format(endTime1);
		
		model.addAttribute("materialInfo",materialInfo);//设置物资表
		model.addAttribute("stratTime",stratTime);
		model.addAttribute("endTime",endTime);
		return "/xitong/xtgl_wzzsj_modification";
	}
	
	//保存修改
	@RequestMapping(value="/materialUpdate")
	public @ResponseBody String materialUpdate(Material material,String stratTime1,String endTime1) {
		//日期转换器
		String startTime2 = stratTime1 + " 00:00:00";
		String endTime2 = endTime1 + " 00:00:00";
		DateConveter dateConveter = new DateConveter();
		Date stratTime = dateConveter.convert(startTime2);
		Date endTime = dateConveter.convert(endTime2);
		material.setStratTime(stratTime);
		material.setEndTime(endTime);
		Date date = new Date();
		material.setCreateTime(date);
		//更新物资
		xtgl_wzzsjService.updateMaterial(material);
		return "OK";
	}
	
	//查看
	@RequestMapping(value="/xtgl_wzzsj/materialView")
	public String materialView(Integer id,Model model) {
		//通过id查找物资
		Material materialInfo = xtgl_wzzsjService.queryMaterialById(id);
		//获得数据库时间,转换为String
		Date stratTime1 = materialInfo.getStratTime();
		Date endTime1 = materialInfo.getEndTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String stratTime = sdf.format(stratTime1);
		String endTime = sdf.format(endTime1);
		
		model.addAttribute("materialInfo",materialInfo);
		model.addAttribute("stratTime",stratTime);
		model.addAttribute("endTime",endTime);		
		return "xitong/xtgl_wzzsj_detail";
	}
	
	//去新增页面
	@RequestMapping(value="/xtgl_append")
	public String appendPage(Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String timeNum = sdf.format(date);
		String materialCode = "WZBH" + timeNum;
		model.addAttribute("materialCode",materialCode);
		return "xitong/xtgl_wzzsj_append";
	}
	
	//新增物质
	@RequestMapping(value="/xtgl_appendMaterial")
	public @ResponseBody String appendMaterial(Material material,String startTime1,String endTime1) {
		//日期转换器
		DateConveter dateConveter = new DateConveter();
		String startTime2 = startTime1 + " 00:00:00";
		String endTime2 = endTime1 + " 00:00:00";
		Date stratTime = dateConveter.convert(startTime2);
		Date endTime = dateConveter.convert(endTime2);
		Date nowDate = new Date();
		
		material.setCreateTime(nowDate);
		material.setStratTime(stratTime);
		material.setEndTime(endTime);
		xtgl_wzzsjService.insertMaterial(material);
		return "OK";
	}
	
	//删除
	@RequestMapping(value="/materialDel")
	public @ResponseBody String del(Integer id) {
		xtgl_wzzsjService.deleteMaterial(id);
		return "ok";
	}
	
	//批量删除
	@RequestMapping(value="/materialDels")
	public @ResponseBody String dels(Integer[] aa) {
		xtgl_wzzsjService.delsMaterial(aa);
		return "ok";
	}
	
	//入口
	@RequestMapping(value="/xtgl_xtgl/contractList1")
	public String xxaa() {	
		return "/xitong/xtgl_wzzsj";
	}
}
