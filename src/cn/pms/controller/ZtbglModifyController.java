package cn.pms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
import cn.pms.pojo.Zbandgy;
import cn.pms.service.ProjectService;
import cn.pms.service.PurchasePlanService;
import cn.pms.service.PurchaseService;
import cn.pms.service.SupplierService;
import cn.pms.service.TenderingheadinfoService;
import cn.pms.service.TenderingplanService;
import cn.pms.service.ZbandgyService;
@Controller
public class ZtbglModifyController { 
	
	//得到招标文件,
	//修改招标头
	//修改招标行(采购头的id获取采购行,物资编码放大镜)
	//查看招标头的详细信息
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
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private ZbandgyService zbandgyService ;
    //通过id查要修改的招标文件
	@RequestMapping("/zhaobiao/ztbgl_gkzb_modification")
	public ModelAndView lookGkzbDetailModification(Integer id){
		//通过id查询招标头
		Tenderingheadinfo tenderingheadinfo = tenderingheadinfoService.selectTenderingheadinfoById(id);
		//通过招标头的id查询招标行中tenderingHeadId对应行
		List<Tenderingplan> tenderingplanList = tenderingplanService.selectTenderingplanById(tenderingheadinfo.getId());
		//通过招标头的purchaseId查询采购头中id对应行
		Purchaseheadinfo purchaseheadinfo= tenderingplanService.selectPurchaseheadinfoById(tenderingheadinfo.getPurchaseId());
		if(purchaseheadinfo == null){
			ModelAndView modelAndView = new ModelAndView();
			
			List<Purchaseplan> purchaseplanList = new ArrayList<Purchaseplan>();
			Project project = new Project();
			List<Material> materialList = new ArrayList<Material>();
			
			List<Integer> supplierIdList = tenderingplanService.selectZbandgyById(tenderingheadinfo.getId());
			List<Supplier> supplierList = new ArrayList<Supplier>();
			for(int i = 0 ;i<supplierIdList.size();i++){
				Integer supplierId = supplierIdList.get(i);
				Supplier supplier = tenderingplanService.selectSupplierById(supplierId);
				if(supplier != null){
					supplierList.add(supplier);
				}
			}
			modelAndView.addObject("tenderingheadinfo", tenderingheadinfo);
			modelAndView.addObject("tenderingplanList", tenderingplanList);
			modelAndView.addObject("purchaseheadinfo", purchaseheadinfo);
			modelAndView.addObject("purchaseplanList", purchaseplanList);
			modelAndView.addObject("project", project);
			modelAndView.addObject("materialList", materialList);
			modelAndView.addObject("supplierList", supplierList);
			modelAndView.setViewName("zhaobiao/ztbgl_gkzb_modification");
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
			modelAndView.setViewName("zhaobiao/ztbgl_gkzb_modification");
			return modelAndView;
		}
		
	}
	
	//修改招标头的提交保存
	@ResponseBody
	@RequestMapping("/zhaobiao/ztbgl_gkzb_modifySubmitTenderingheadinfo")
	public Map<String, Object> modifySubmitGkzbTenderingheadinfo(Tenderingheadinfo tenderingheadinfo){
		Map<String, Object> map= new HashMap<String, Object>();
		tenderingheadinfoService.updateTenderingheadinfo(tenderingheadinfo);
		return map;
	}	
	
	//修改招标行的提交保存（必须在List前加RequestMapping）
	@RequestMapping("/zhaobiao/ztbgl_gkzb_modifySubmitTenderingplan")
	@ResponseBody
	public String modifySubmitGkzb(@RequestBody List<Tenderingplan> tenderingPlanListDTO){
		PurchaseplanCustom purchaseplanCustom = new PurchaseplanCustom();
		for(int i = 0; i < tenderingPlanListDTO.size();i++){
			
			if(tenderingPlanListDTO.get(i).getId()!=null){
				System.out.println("//修改的提交保存");
				tenderingplanService.updateTenderingplan(tenderingPlanListDTO.get(i));
				purchaseplanCustom.setId(tenderingPlanListDTO.get(i).getPurchasePlanId());
				purchaseplanCustom.setUseNumber(tenderingPlanListDTO.get(i).getUseNum());
				tenderingplanService.updateUseNumber(purchaseplanCustom);
			}else{
				System.out.println("//修改真加的提交保存");
				tenderingplanService.insertTenderingplan(tenderingPlanListDTO.get(i));
				purchaseplanCustom.setId(tenderingPlanListDTO.get(i).getPurchasePlanId());
				purchaseplanCustom.setUseNumber(tenderingPlanListDTO.get(i).getUseNum());
				tenderingplanService.updateUseNumber(purchaseplanCustom);
			}
		}
		return "1";
	}

	//供应商放大镜
	@RequestMapping("/zhaobiao/findSupplier")
	@ResponseBody
	public Map<String, Object> findSupplier(String supplierCode,String supplierName,
			String supplierType,String nowPageNum,String eachPageNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		int nowPage = Integer.parseInt(nowPageNum);
		int eachPNum = Integer.parseInt(eachPageNum);
		int supplierCount = supplierService.getCount(supplierCode, supplierName, supplierType);
		PageModel pageModel = new PageModel(eachPNum, supplierCount, nowPage);
		ArrayList<Supplier> supplierList = supplierService.findSupplier(pageModel, supplierCode, supplierName, supplierType);
		map.put("pageModel", pageModel);
		map.put("supplierList", supplierList);
		return map;
	}
	//删除要修改的招标行
	@RequestMapping("/zhaobiao/delTenderPlan")
	public Map<String,Object> delTenderPlan(@RequestBody int[] delTenders){
		Map<String, Object> map = new HashMap<String, Object>();
		Tenderingplan tenderingplan = new Tenderingplan();
		for(int delTender:delTenders){
			tenderingplan.setId(delTender);
			System.out.println("删除要修改的招标头"+tenderingplan.getId());
			tenderingplan.setIsFlag(1);
			tenderingplanService.updateDelTenderPlan(tenderingplan);
		}
		String msg = "删除成功";
		map.put("msg", msg);
		return map;
	}
	
	//供应商与招标的关系
	@RequestMapping("/zhaobiao/submitSupplier")
	@ResponseBody
	public String submitSupplier(@RequestBody List<Zbandgy> supplierListDTO){
		Zbandgy zbandgy = new Zbandgy();
		List<Zbandgy> zbandgyList = new ArrayList<Zbandgy>();
		int id = supplierListDTO.get(0).getTenderingheadinfoId();
		
		//删除此份招标头关联的所有关联关系
		zbandgyService.deleteZbandgy(id);
		for(int i = 0; i < supplierListDTO.size();i++){
			zbandgy.setTenderingheadinfoId(id);
			zbandgy.setSupplierId(supplierListDTO.get(i).getSupplierId());
			zbandgyService.insertSupplierAnd(zbandgy);
			System.out.println("招标与供应商添加OK");
		}
		return "1";
	}
}
