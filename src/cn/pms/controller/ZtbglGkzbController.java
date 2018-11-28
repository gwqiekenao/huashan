package cn.pms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.pms.pojo.Fast;
import cn.pms.pojo.Material;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Project;
import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;
import cn.pms.pojo.Supplier;
import cn.pms.pojo.Tenderingheadinfo;
import cn.pms.pojo.Tenderingplan;
import cn.pms.service.ProjectService;
import cn.pms.service.PurchasePlanService;
import cn.pms.service.PurchaseService;
import cn.pms.service.TenderingheadinfoService;
import cn.pms.service.TenderingplanService;
@Controller
public class ZtbglGkzbController {
	@Autowired
	private HttpServletRequest request;
	//招标头
    @Autowired   
    private TenderingheadinfoService tenderingheadinfoService;
    @Autowired 
    private TenderingplanService tenderingplanService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private PurchasePlanService purchasePlanService;
	@RequestMapping("/zhaobiao/ztbgl_gkzb")
	public String tenderingHeadInfoQuery(
			@RequestParam(value = "nowPageNum", required = false)String nowPageNum,
			@RequestParam(value = "eachPageNum", required = false)String eachPageNum,
			@RequestParam(value = "tenderingCode", required = false) String tenderingCode,
			@RequestParam(value = "purchaseType", required = false) String purchaseType,
			@RequestParam(value = "tenderingName", required = false) String tenderingName)
			throws Exception {
		int nowPage;
		int eachPNum;
		if(nowPageNum == null || nowPageNum == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(nowPageNum);
		}
		if(eachPageNum == null || eachPageNum == "") {
			eachPNum = 10;
		} else {
			eachPNum = Integer.parseInt(eachPageNum);
		}
		
		Integer tenderingheadinfoCount = tenderingheadinfoService.tenderingheadinfoCount(tenderingCode,purchaseType,tenderingName);
		PageModel pageModel = new PageModel(eachPNum, tenderingheadinfoCount, nowPage);
		List<Tenderingheadinfo> tenderingheadinfoList = tenderingheadinfoService.selectTenderingheadinfo(pageModel,tenderingCode,purchaseType,tenderingName);
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("tenderingheadinfoList", tenderingheadinfoList);
		request.setAttribute("tenderingCode", tenderingCode);
		request.setAttribute("purchaseType", purchaseType);
		request.setAttribute("tenderingName", tenderingName);
		return "zhaobiao/ztbgl_gkzb";
	}
	//查看招标头的详细信息
	@RequestMapping("/zhaobiao/ztbgl_gkzb_detail")
	public ModelAndView lookGkzbDetail(Integer id){
		
		//通过id查询招标头
		Tenderingheadinfo tenderingheadinfo = tenderingheadinfoService.selectTenderingheadinfoById(id);
		//通过招标头的id查询招标行中tenderingHeadId对应行
		List<Tenderingplan> tenderingplanList = tenderingplanService.selectTenderingplanById(tenderingheadinfo.getId());
		//通过招标头的purchaseId查询采购头中id对应行
		Purchaseheadinfo purchaseheadinfo= tenderingplanService.selectPurchaseheadinfoById(tenderingheadinfo.getPurchaseId());
		if(purchaseheadinfo == null){
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("tenderingheadinfo", tenderingheadinfo);
			modelAndView.addObject("tenderingplanList", tenderingplanList);
//			modelAndView.addObject("purchaseheadinfo", purchaseheadinfo);
//			modelAndView.addObject("purchaseplanList", purchaseplanList);
//			modelAndView.addObject("project", project);
//			modelAndView.addObject("materialList", materialList);
//			modelAndView.addObject("supplierList", supplierList);
			modelAndView.setViewName("zhaobiao/ztbgl_gkzb_detail");
			return modelAndView;
		}else{
			
			//得到tenderingplan的采购行purchasePlanId
			//通过采购头中id查询采购行中purchaseId对应行（对应查找有问题（多对一（多个招标对应一个采购）））
			List<Purchaseplan> purchaseplanList = new ArrayList<Purchaseplan>();
			for(int i = 0; i < tenderingplanList.size(); i++){
				Integer purchasePlanId = tenderingplanList.get(i).getPurchasePlanId();
				Purchaseplan purchaseplan = tenderingplanService.selectPurchaseplanById(purchasePlanId);
				if(purchaseplan != null){
					purchaseplanList.add(purchaseplan);
				}

			}
			//物质的查询list结果
			List<Material> materialList = new ArrayList<Material>();
			//从采购行中取出物资的materialId
			for(int i = 0 ;i<purchaseplanList.size();i++){
				Material material = tenderingplanService.selectMaterialById(purchaseplanList.get(i).getMaterialId());
				if(material != null){
					materialList.add(material);
				}	
			}
			//通过id找项目
			Project project = projectService.findProById(purchaseheadinfo.getProjectId());
			List<Integer> supplierIdList = tenderingplanService.selectZbandgyById(tenderingheadinfo.getId());
			List<Supplier> supplierList = new ArrayList<Supplier>();
			for(int i = 0 ;i<supplierIdList.size();i++){
				Integer supplierId = supplierIdList.get(i);
				Supplier supplier = tenderingplanService.selectSupplierById(supplierId);
				if(supplier != null){
					supplierList.add(supplier);
				}	
			}
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("tenderingheadinfo", tenderingheadinfo);
			modelAndView.addObject("tenderingplanList", tenderingplanList);
			modelAndView.addObject("purchaseheadinfo", purchaseheadinfo);
			modelAndView.addObject("purchaseplanList", purchaseplanList);
			modelAndView.addObject("project", project);
			modelAndView.addObject("materialList", materialList);
			modelAndView.addObject("supplierList", supplierList);
			modelAndView.setViewName("zhaobiao/ztbgl_gkzb_detail");
			return modelAndView;
		}
		
	}
	
	//增加
	@RequestMapping("/zhaobiao/ztbgl_gkzb_add")
	public ModelAndView addGkzb(){
		ModelAndView modelAndView = new ModelAndView();
		//招标编号ZBBH+年月日时分秒毫秒（进入新增页面时，自动生成）
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String tenderingCode = "ZBBH" + sdf.format(new Date());
		modelAndView.addObject("tenderingCode", tenderingCode);
		
		modelAndView.setViewName("zhaobiao/ztbgl_gkzb_add");
		return modelAndView;
	}
	
	//增加招标头的提交保存
	@ResponseBody
	@RequestMapping("/zhaobiao/ztbgl_gkzb_addSubmitTenderingheadinfo")
	public Map<String, Object> addSubmitGkzbTenderingheadinfo(Tenderingheadinfo tenderingheadinfo){
		Map<String, Object> map= new HashMap<String, Object>();
		tenderingheadinfoService.insertTenderingheadinfo(tenderingheadinfo);
		System.out.println("tenderingheadinfo.getTenderingCode()========="+tenderingheadinfo.getTenderingCode());
		Tenderingheadinfo findTenderingheadinfo = tenderingheadinfoService.findTenderingheadinfo(tenderingheadinfo.getTenderingCode());
		map.put("tenderingheadinfoId", findTenderingheadinfo.getId());
		return map;
	}

	//增加招标行的提交保存（必须在List前加RequestMapping）
	@RequestMapping("/zhaobiao/ztbgl_gkzb_addSubmitTenderingplan")
	@ResponseBody
	public String addSubmitGkzb(@RequestBody List<Tenderingplan> tenderingPlanListDTO){
		PurchaseplanCustom purchaseplanCustom = new PurchaseplanCustom();
		for(int i = 0; i < tenderingPlanListDTO.size();i++){        
			tenderingplanService.insertTenderingplan(tenderingPlanListDTO.get(i));
			purchaseplanCustom.setId(tenderingPlanListDTO.get(i).getPurchasePlanId());
			purchaseplanCustom.setUseNumber(tenderingPlanListDTO.get(i).getUseNum());
			tenderingplanService.updateUseNumber(purchaseplanCustom);
		}
		
		System.out.println("//增加的提交保存");
		return "1";
	}
	//采购头放大镜
	@ResponseBody
	@RequestMapping("/zhaobiao/findPurchaseInfo")
	public Map<String, Object> findPurchaseInfo(PurchaseCustom purchaseCustom,HttpServletRequest request) {
		
		Map<String, Object> map= new HashMap<String, Object>();
		if(purchaseCustom == null) {
			purchaseCustom = new PurchaseCustom();
		}
		int count = purchaseService.getCount(purchaseCustom);
		if(purchaseCustom.getEachPageNum() == null) {
			purchaseCustom.setEachPageNum(10);
		}
		if(purchaseCustom.getNowPageNum() == null) {
			purchaseCustom.setNowPageNum(1);
		}
		
		PageModel page = new PageModel(purchaseCustom.getEachPageNum(),count,purchaseCustom.getNowPageNum());
		purchaseCustom.setDataNum(count);
		purchaseCustom.setPageCount(page.getPageCount());
		purchaseCustom.setPageData(page.getPageData());
		ArrayList<PurchaseCustom> purchaseInfolist = purchaseService.findPurchaseInfo(purchaseCustom);
		List<Fast> fastAll = (List<Fast>) request.getSession().getAttribute("fastAll");
		map.put("fastAll", fastAll);
		map.put("purchaseCustom", purchaseCustom);
		map.put("purchaseInfolist", purchaseInfolist);
		return map;
	}
	
	//物质编码（对应的采购行的信息）放大镜
	@ResponseBody
	@RequestMapping("/zhaobiao/findMaterial")
	public Map<String, Object> findPurchaseplan(PurchaseCustom purchaseCustom,HttpServletRequest request) {
		
		Map<String, Object> map= new HashMap<String, Object>();
		if(purchaseCustom == null) {
			purchaseCustom = new PurchaseCustom();
		}
		
		int count = purchaseService.getCount(purchaseCustom);
		if(purchaseCustom.getEachPageNum() == null) {
			purchaseCustom.setEachPageNum(3);
		}
		
		if(purchaseCustom.getNowPageNum() == null) {
			purchaseCustom.setNowPageNum(1);
		}
		//分页模型
		PageModel page = new PageModel(purchaseCustom.getEachPageNum(),count,purchaseCustom.getNowPageNum());
		purchaseCustom.setDataNum(count);
		purchaseCustom.setPageCount(page.getPageCount());
		purchaseCustom.setPageData(page.getPageData());
		ArrayList<PurchaseplanCustom> purchasePlanList = purchasePlanService.findPurchasePlan(purchaseCustom.getId());
		//通过id找项目
		Project project = projectService.findProById(purchaseCustom.getProjectId());
		//物质的查询list结果
		List<Material> materialList = new ArrayList<Material>();
		//从采购行中取出物资的materialId
		for(int i = 0 ;i<purchasePlanList.size();i++){
			Material material = tenderingplanService.selectMaterialById(purchasePlanList.get(i).getMaterialId());
			
			if(material !=null){
				materialList.add(material);
			}
		}
		List<Fast> fastAll = (List<Fast>) request.getSession().getAttribute("fastAll");
		map.put("purchasePlanList", purchasePlanList);
		map.put("materialList", materialList);
		map.put("fastAll", fastAll);
		map.put("project", project);
		return map;
	}
	//删除招标
	@RequestMapping("/zhaobiao/delTender")
	@ResponseBody
	public String delTender(@RequestBody int[] delTenders){
		Tenderingheadinfo tenderingheadinfo = new Tenderingheadinfo();
		for(int delTender:delTenders){
			tenderingheadinfo.setId(delTender);
			tenderingheadinfo.setIsFlag(1);
			tenderingheadinfoService.updateDelTenderhead(tenderingheadinfo);
		}
		return "1";
	}
	
	@RequestMapping("/zhaobiao/tenderingheadinfo")
	@ResponseBody
	public Map<String,Object> tenderingheadinfo(
			String nowPageNum,
			String eachPageNum,
			String tenderingCode,
			String tenderingName)
			throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		int	nowPage = Integer.parseInt(nowPageNum);
		int	eachPNum = Integer.parseInt(eachPageNum);
		int zbCount = tenderingheadinfoService.tenderingheadinfoCount(tenderingCode, "", tenderingName);
		PageModel pageModel = new PageModel(eachPNum, zbCount, nowPage);
		List<Tenderingheadinfo> zbList = tenderingheadinfoService.selectTenderingheadinfo(pageModel, tenderingCode, "", tenderingName);
		map.put("pageModel", pageModel);
		map.put("zbList", zbList);
		return map;
	}
}
