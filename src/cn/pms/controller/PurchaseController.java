package cn.pms.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.PurchasePack;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;
import cn.pms.pojo.User;
import cn.pms.service.PurchasePlanService;
import cn.pms.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private PurchasePlanService purchasePlanService;

	@RequestMapping("/findPurchaseInfo")
	public ModelAndView findPurchaseInfo(PurchaseCustom purchaseCustom,
			@RequestParam(value="msg",required=false)String msg) {
		ModelAndView modelAndView = new ModelAndView();
		if (purchaseCustom == null) {
			purchaseCustom = new PurchaseCustom();
		}
		int count = purchaseService.getCount(purchaseCustom);
		if (purchaseCustom.getEachPageNum() == null) {
			purchaseCustom.setEachPageNum(10);
		}
		if (purchaseCustom.getNowPageNum() == null) {
			purchaseCustom.setNowPageNum(1);
		}
		PageModel page = new PageModel(purchaseCustom.getEachPageNum(), count, purchaseCustom.getNowPageNum());
		purchaseCustom.setDataNum(count);
		purchaseCustom.setPageCount(page.getPageCount());
		purchaseCustom.setPageData(page.getPageData());
		ArrayList<PurchaseCustom> purchaseInfolist = purchaseService.findPurchaseInfo(purchaseCustom);
		if(msg != null && msg != "") {
			try {
				msg = new String(msg.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			modelAndView.addObject("msg", msg);
		}
		modelAndView.addObject("purchaseCustom", purchaseCustom);
		modelAndView.addObject("purchaseInfolist", purchaseInfolist);
		modelAndView.setViewName("caigou/cggl_cgjh");
		return modelAndView;
	}

	@RequestMapping("/purchaseDetail")
	public ModelAndView purchaseDetail(int id) {
		ModelAndView modelAndView = new ModelAndView();
		PurchaseCustom purchaseHeadInfo = purchaseService.findPurchaseInfoById(id);
		ArrayList<PurchaseplanCustom> purchaseplanList = purchasePlanService.findPurchasePlan(id);
		modelAndView.addObject("purchaseHeadInfo", purchaseHeadInfo);
		modelAndView.addObject("purchaseplanList", purchaseplanList);
		modelAndView.setViewName("caigou/cggl_cgjh_detail");
		return modelAndView;
	}

	@RequestMapping("/deletePurchases")
	public ModelAndView deletePurchases(String purchaseCodes) {
		String[] codes = purchaseCodes.split(",");
		ModelAndView modelAndView = new ModelAndView();
		int n = purchaseService.deletePurchases(codes);
		String msg;
		if(n == codes.length) {
			msg = "删除成功";
		} else {
			msg = "删除失败";
		}
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("redirect:/purchase/findPurchaseInfo");
		return modelAndView;
	}

	@RequestMapping("/update")
	public ModelAndView update(int id) {
		ModelAndView modelAndView = new ModelAndView();
		PurchaseCustom purchaseHeadInfo = purchaseService.findPurchaseInfoById(id);
		ArrayList<PurchaseplanCustom> purchaseplanList = purchasePlanService.findPurchasePlan(id);
		modelAndView.addObject("purchaseHeadInfo", purchaseHeadInfo);
		modelAndView.addObject("purchaseplanList", purchaseplanList);
		modelAndView.setViewName("caigou/cggl_cgjh_modification");
		return modelAndView;
	}

	@RequestMapping("/updatePurchase")
	public ModelAndView updatePurchase(PurchasePack purchase,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		purchaseService.updatePurHead(purchase.getPurchaseHead());
		if(purchase.getPurchasePlans() != null) {
			for (Purchaseplan pl : purchase.getPurchasePlans()) {
				if(pl != null) {
					if (pl.getId() != null) {
						purchasePlanService.updatePurPlan(pl);
					} else {
						if(pl.getMaterialId() != null) {
							pl.setCreateUser(((User)session.getAttribute("currentUser")).getUserName());
							pl.setPurchaseId(purchase.getPurchaseHead().getId());
							purchasePlanService.insertPurPlan(pl);
						}
					}
				}
			}
		}
		modelAndView.addObject("msg", "修改成功");
		modelAndView.setViewName("redirect:/purchase/findPurchaseInfo");
		return modelAndView;
	}

	@RequestMapping("/deletePurPlan")
	@ResponseBody
	public String deletePurPlan(String purPlanIds) {
		String[] purPlanId = purPlanIds.split(",");
		int[] ids = new int[purPlanId.length];
		for (int i = 0; i < purPlanId.length; i++) {
			ids[i] = Integer.parseInt(purPlanId[i]);
		}
		int n = purchasePlanService.deletePurPlan(ids);
		String flag = "1";
		if (n == ids.length) {
			flag = "2";
		}
		return flag;
	}
	
	@RequestMapping("insertPur")
	public ModelAndView insertPur() {
		ModelAndView modelAndView = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String purchaseCode = "CGJH" + sdf.format(new Date());
		modelAndView.addObject("purchaseCode",purchaseCode);
		modelAndView.setViewName("caigou/cggl_cgjh_add");
		return modelAndView;
	}
	
	@RequestMapping("/insertPurchase")
	public ModelAndView insertPurchase(PurchasePack purchase,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		Purchaseheadinfo purchaseHead = purchase.getPurchaseHead();
		purchaseService.insertPurHead(purchaseHead);
		if(purchase.getPurchasePlans() != null) {
			for (Purchaseplan pl : purchase.getPurchasePlans()) {
				if(pl != null) {
					if(pl.getMaterialId() != null) {
						pl.setCreateUser(((User)session.getAttribute("currentUser")).getUserName());
						pl.setPurchaseId(purchaseHead.getId());
						purchasePlanService.insertPurPlan(pl);
					}
				}
			}
		}
		modelAndView.addObject("msg", "增加成功");
		modelAndView.setViewName("redirect:/purchase/findPurchaseInfo");
		return modelAndView;
	}

}
