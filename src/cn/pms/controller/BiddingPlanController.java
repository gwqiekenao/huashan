package cn.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.BiddingPlanCustom;
import cn.pms.pojo.BiddingPlanPack;
import cn.pms.pojo.Biddingplan;
import cn.pms.pojo.Expert;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Zbandzj;
import cn.pms.service.BiddingPlanService;

@Controller
@RequestMapping("/bidding")
public class BiddingPlanController {
	
	@Autowired
	BiddingPlanService biddingPlanService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/findBidding")
	public String findBidding() {
		return "zhaobiao/ztbgl_zbfazz";
	}
	
	@RequestMapping("/findBiddingPlan")
	@ResponseBody
	public Map<String,Object> findBiddingPlan(String nowPageNum,String eachPageNum,String tenderingCode,
			String tenderingName,String biddingName)
			throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		int	nowPage = Integer.parseInt(nowPageNum);
		int	eachPNum = Integer.parseInt(eachPageNum);
		int biddingCount = biddingPlanService.getCount(tenderingCode, tenderingName, biddingName);
		PageModel pageModel = new PageModel(eachPNum, biddingCount, nowPage);
		ArrayList<BiddingPlanCustom> biddingList = biddingPlanService.findBidPlan(pageModel, tenderingCode, tenderingName, biddingName);
		map.put("pageModel", pageModel);
		map.put("biddingList", biddingList);
		return map;
	}
	
	@RequestMapping("/deleteBids")
	@ResponseBody
	public String deleteBids(String biddingIds) {
		String[] bidIds = biddingIds.split(",");
		int[] ids = new int[bidIds.length];
		for (int i = 0; i < ids.length; i++) {
			ids[i] = Integer.parseInt(bidIds[i]);
		}
		int n = biddingPlanService.deleteBidding(ids);
		String flag = "2";
		if(n == ids.length) {
			flag = "1";
		}
		return flag;
	}
	
	@RequestMapping("/bidDetail")
	public ModelAndView  bidDetail(int id) {
		ModelAndView modelAndView = new ModelAndView();
		BiddingPlanCustom bidding =  biddingPlanService.findBidById(id);
		ArrayList<Expert> expertList = biddingPlanService.findExpert(id);
		modelAndView.addObject("bidding",bidding);
		modelAndView.addObject("expertList",expertList);
		modelAndView.setViewName("zhaobiao/ztbgl_zbfazz_detail");
		return modelAndView;
	}
	
	@RequestMapping("/updateBid")
	public ModelAndView  updateBid(int id) {
		ModelAndView modelAndView = new ModelAndView();
		BiddingPlanCustom bidding =  biddingPlanService.findBidById(id);
		ArrayList<Expert> expertList = biddingPlanService.findExpert(id);
		modelAndView.addObject("bidding",bidding);
		modelAndView.addObject("expertList",expertList);
		modelAndView.setViewName("zhaobiao/ztbgl_zbfazz_modification");
		return modelAndView;
	}
	
	@RequestMapping("/updateBidding")
	public String updateBidding(BiddingPlanPack bidding) {
		Biddingplan bp = bidding.getBidding();
		biddingPlanService.updateBidding(bp);
		if(bidding.getZbandzj() != null) {
			for(Zbandzj z : bidding.getZbandzj()) {
				if(z.getExpertId() != null) {
					z.setBiddingPlanId(bp.getId());
					biddingPlanService.insert(z);
				}
			}
		}
		request.setAttribute("msg","修改成功");
		return "zhaobiao/ztbgl_zbfazz";
	}
	
	@RequestMapping("/addBid")
	public String addBid() {
		return "zhaobiao/ztbgl_zbfazz_add";
	}
	
	@RequestMapping("/insertBidding")
	public String insertBidding(BiddingPlanPack bidding) {
		Biddingplan bp = bidding.getBidding();
		biddingPlanService.insertBidding(bp);
		if(bidding.getZbandzj() != null) {
			for(Zbandzj z : bidding.getZbandzj()) {
				if(z.getExpertId() != null) {
					z.setBiddingPlanId(bp.getId());
					biddingPlanService.insert(z);
				}
			}
		}
		request.setAttribute("msg","增加成功");
		return "zhaobiao/ztbgl_zbfazz";
	}
	
	@RequestMapping("/deleteExpert")
	@ResponseBody
	public String deleteExpert(String expIds,int biddingId) {
		String[] expertId = expIds.split(",");
		int[] ids = new int[expertId.length];
		for (int i = 0; i < expertId.length; i++) {
			ids[i] = Integer.parseInt(expertId[i]);
			biddingPlanService.delete(biddingId, ids[i]);
		}
		return "2";
	}
	
}
