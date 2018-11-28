package cn.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pms.pojo.Expert;
import cn.pms.pojo.PageModel;
import cn.pms.service.ExpertService;

@Controller
@RequestMapping("/expert")
public class ExpertController {

	@Autowired
	ExpertService expertService;
	
	@RequestMapping("/findExpert")
	@ResponseBody
	public Map<String,Object> findExpert(String expertCode,String name,int nowPageNum,int eachPageNum) {
		Map<String,Object> map = new HashMap<String,Object>();
		int expertCount = expertService.getCount(expertCode, name);
		PageModel pageModel = new PageModel(eachPageNum,expertCount,nowPageNum);
		ArrayList<Expert> expertList = expertService.findExpert(pageModel, expertCode, name);
		map.put("pageModel", pageModel);
		map.put("expertList", expertList);
		return map;
	}
	
}
