package cn.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pms.pojo.Fast;
import cn.pms.pojo.Material;
import cn.pms.pojo.PageModel;
import cn.pms.service.MaterialService;

@Controller
@RequestMapping("/material")
public class MaterialController {
	
	@Autowired
	MaterialService materialService;
	
	@RequestMapping("/findMaterial")
	@ResponseBody
	public Map<String, Object> findMaterial(String materialCode,String materialName,
			String materialType,String nowPageNum,String eachPageNum,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		int nowPage = Integer.parseInt(nowPageNum);
		int eachPNum = Integer.parseInt(eachPageNum);
		List<Fast> fastList = (List<Fast>)session.getAttribute("fastAll");
		int materialCount = materialService.getCount(materialCode, materialName, materialType);
		PageModel pageModel = new PageModel(eachPNum, materialCount, nowPage);
		ArrayList<Material> materialList = materialService.findMaterial(pageModel, materialCode, 
				materialName, materialType);
		map.put("pageModel", pageModel);
		map.put("materialList", materialList);
		map.put("fastList", fastList);
		return map;
	}
}
