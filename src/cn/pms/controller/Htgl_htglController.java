package cn.pms.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.format.DecimalStyle;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Delayed;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pms.pojo.Contractheadinfo;
import cn.pms.pojo.Contractinfo;
import cn.pms.pojo.DateConveter;
import cn.pms.pojo.Fast;
import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.QueryVo;
import cn.pms.pojo.Supplier;
import cn.pms.pojo.Tenderingheadinfo;
import cn.pms.pojo.User;
import cn.pms.service.Htgl_htglService;




@Controller
public class Htgl_htglController {
	
	@Autowired
	private Htgl_htglService Htgl_htglService;
	
	//返回主页面数据
	@RequestMapping(value="/htgl_htgl/contractList.action")
	public @ResponseBody Map<String, Object> contractList(QueryVo vo,HttpSession session) {
		List<Fast> fastAll = (List<Fast>)session.getAttribute("fastAll");
		Map map = new HashMap<>();
		//查询合同分页对象
		Page<Contractheadinfo> contractPage = Htgl_htglService.queryContractByVo(vo);
		map.put("fastAll", fastAll);
		map.put("contractPage", contractPage);
		return map;
	}
	
	//去合同查看
	@RequestMapping(value="/hetong_detail.action")
	public String ContractDetail(Integer id,Integer tenderingHeadInfoId,String contractCode,Model model) {
		
		//合同头信息表
		Contractheadinfo contractheadinfo = Htgl_htglService.queryContractById(id);	
		//合同经办人信息
		User userInfo = Htgl_htglService.queryUserInfoById(contractheadinfo.getUserId());
		
		//合同行信息表
		//通过合同头表的tenderingHeadInfoId查招标头,行
		List<Tenderingheadinfo> tenderInfoList = Htgl_htglService.queryTenderInfo(tenderingHeadInfoId);
//		//查采购头,行,项目
		List<Purchaseheadinfo> purchaseInfoList = Htgl_htglService.queryPurchaseInfo(tenderingHeadInfoId);
//		//查物质
		List<Material> materialsList = Htgl_htglService.queryMaterial();
//		//合同文件信息表
		Contractinfo contractinfo = Htgl_htglService.queryContractLine(contractCode);
		
		//合同头日期转换
		SimpleDateFormat sdf = new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss" ); 
		String startTime = sdf.format(contractheadinfo.getStartTime());
		String endTime= sdf.format(contractheadinfo.getEndTime());
		
		model.addAttribute("user", userInfo);
		model.addAttribute("startTime",startTime);
		model.addAttribute("endTime",endTime);
		model.addAttribute("contractheadinfo",contractheadinfo);
		model.addAttribute("tenderInfoList",tenderInfoList);
		model.addAttribute("purchaseInfoList",purchaseInfoList);
		model.addAttribute("materialsList",materialsList);
		model.addAttribute("contractinfo",contractinfo);
		return "hetong/htgl_htgl_detail";
	}
		
	//去合同修改页面
	@RequestMapping(value="/htgl_modification.action")
	public String ContractModification(Model model,String companyName,String supplieName,String contractCode,Integer id) {
		
		//合同头信息表
		Contractheadinfo contractheadinfo = Htgl_htglService.queryContractById(id);
		//合同文件信息表
		Contractinfo contractinfo = Htgl_htglService.queryContractLine(contractCode);
		
		//合同头日期转换
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" ); 
		String startTime = sdf.format(contractheadinfo.getStartTime());
		String endTime= sdf.format(contractheadinfo.getEndTime());
		
		//接收中文编码
		try {
			companyName = new String(companyName.getBytes("ISO8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//通过合同经办人id查user
		User user = Htgl_htglService.queryUserInfoById(contractheadinfo.getUserId());
		
		model.addAttribute("startTime",startTime);
		model.addAttribute("endTime",endTime);
		model.addAttribute("contractheadinfo", contractheadinfo);
		model.addAttribute("contractinfo", contractinfo);
		model.addAttribute("companyName",companyName);
		model.addAttribute("supplieName", supplieName);
		model.addAttribute("contractCode",contractCode);
		model.addAttribute("user",user);
		model.addAttribute("id",id);
		return "hetong/htgl_htgl_modification";
	}
		
	//修改页面招标编号查询
	@RequestMapping(value="/htgl_htgl/tenderNumberList.action")
	public @ResponseBody Page<Tenderingheadinfo> list(QueryVo vo) {
		//通过四个条件,查询招标编号分页对象
		Page<Tenderingheadinfo> tenderingPage = Htgl_htglService.queryTenderingList(vo);	
		return tenderingPage;
	}
	
	//修改页面经办人查询
	@RequestMapping(value="/htglModify/user")
	public @ResponseBody Page<User> List(QueryVo vo){
		Page<User> userPage = Htgl_htglService.queryUserList(vo);
		return userPage;
	}
	
	//提交合同修改
	@RequestMapping(value="/htgl/saveContract.action")
	public String saveContractHead(Contractheadinfo contractheadinfo,Contractinfo contractinfo,
						   String stratTime1,String endTime1,Integer id1,Integer id2) {
		//日期转换器
		String startTime2 = stratTime1 + " 00:00:00";
		String endTime2 = endTime1 + " 00:00:00";
		DateConveter dateConveter = new DateConveter();
		Date stratTime = dateConveter.convert(startTime2);
		Date endTime = dateConveter.convert(endTime2);
		contractheadinfo.setStartTime(stratTime);
		contractheadinfo.setEndTime(endTime);
		contractheadinfo.setCreateTime(new Date());
		contractinfo.setCreateTime(new Date());
		
		contractheadinfo.setId(id1);
		contractinfo.setId(id2);
		
		Htgl_htglService.updateContractHead(contractheadinfo);
		Htgl_htglService.updateContractInfo(contractinfo);
		return "hetong/htgl_htgl---";
	}
	
	//去新增页面
	@RequestMapping(value="/htgl_append")
	public String htgl_append(Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String timeNum = sdf.format(date);
		String contractCode = "HTBH" + timeNum;
		model.addAttribute("contractCode",contractCode);
		return "hetong/htgl_htgl_append";
	}
	
	//新增页面供应商查询
	@RequestMapping(value="htgl_htgl/supplierList")
	public @ResponseBody Page<Supplier> supplierList(QueryVo vo){
		Page<Supplier> supplierList = Htgl_htglService.querySupplier(vo);
		return supplierList;
	}
	
	//提交新增合同
	@RequestMapping(value="/htgl_appendContract")
	public @ResponseBody String appendContract(Contractheadinfo contractheadinfo,Contractinfo contractinfo,
			   String stratTime1,String endTime1) {
		//日期转换器
		String startTime2 = stratTime1 + " 00:00:00";
		String endTime2 = endTime1 + " 00:00:00";
		DateConveter dateConveter = new DateConveter();
		Date stratTime = dateConveter.convert(startTime2);
		Date endTime = dateConveter.convert(endTime2);
		contractheadinfo.setStartTime(stratTime);
		contractheadinfo.setEndTime(endTime);
		contractheadinfo.setCreateTime(new Date());
		contractinfo.setCreateTime(new Date());
		
		Htgl_htglService.appendContractHeadInfo(contractheadinfo);
		Htgl_htglService.appendContractInfo(contractinfo);
		return "ok";
	}
	
	//合同删除
	@RequestMapping(value="/contractlDel")
	public @ResponseBody String del(Integer id) {
		Htgl_htglService.contractDelete(id);
		return "ok";
	}
	
	//批量删除
	@RequestMapping(value="/contractlDels")
	public @ResponseBody String dels(Integer[] ids) {
		Htgl_htglService.contractDels(ids);
		return "ok";
	}
	
	
	//入口
	@RequestMapping(value="/kkk.action")
	public String ccc() {	
		return "hetong/htgl_htgl---";
	}
	
	//test
	@RequestMapping(value="/htgl_htgl/contractList1")
	public String aa() {	
		return "hetong/htgl_htgl_detail";
	}
}
