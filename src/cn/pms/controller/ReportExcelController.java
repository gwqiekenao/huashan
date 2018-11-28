package cn.pms.controller;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.pms.pojo.Fast;
import cn.pms.pojo.Role;

import cn.pms.pojo.BiddingPlanCustom;



import cn.pms.pojo.Contractheadinfo;
import cn.pms.pojo.Material;
import cn.pms.pojo.Project;
import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.Supplier;

import cn.pms.pojo.Tenderingheadinfo;

import cn.pms.pojo.User;
import cn.pms.service.FastService;
import cn.pms.service.RoleService;

import cn.pms.service.BiddingPlanService;
import cn.pms.service.Htgl_htglService;
import cn.pms.service.ProjectService;
import cn.pms.service.PurchaseService;
import cn.pms.service.SupplierService;

import cn.pms.service.TenderingheadinfoService;

import cn.pms.service.Xtgl_wzzsjService;
import cn.pms.util.ExcelUtil;

import cn.pms.service.UserService;

import cn.pms.util.ExportExcelSeedBack;

@Controller
public class ReportExcelController {

	//招标头
    @Autowired   
    private TenderingheadinfoService tenderingheadinfoService;
    @Autowired
	private RoleService roleService;
    @Autowired
    private PurchaseService purchaseService;
    
    @Autowired
    private ProjectService projectService;
    
    @Autowired
    private SupplierService supplierService;
    
    @Autowired
    private BiddingPlanService biddingPlanService;
    
    @Autowired
    private Htgl_htglService htgl_htglService;
    
    @Autowired
    private Xtgl_wzzsjService xtgl_wzzsjService;
    
	@ResponseBody
	@RequestMapping("/zhaobiao/tend_ReportExcel2")
	public void tend_ReportExcel2(HttpServletRequest request,HttpServletResponse response,int[] expTenders) throws Exception{
		//要导出的数据
		List<Tenderingheadinfo> tenderingheadinfoList = new ArrayList<Tenderingheadinfo>();
		if(expTenders[0] == 0){
			tenderingheadinfoList = tenderingheadinfoService.findTenderheadAll();	
		}else{
			for(int expTender:expTenders){
				Tenderingheadinfo tenderingheadinfo = tenderingheadinfoService.selectTenderingheadinfoById(expTender);
				tenderingheadinfoList.add(tenderingheadinfo);
			}
		}	
	    //导出文件的标题
	    String title = "招标头信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","招标编号","招标名称","招标支出预估(万元)","概算总金额(万元)",
	    								"招标文件购买时间start","招标文件购买时间end","发标日期","开标日期","创建人"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < tenderingheadinfoList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = tenderingheadinfoList.get(i).getTenderingCode();
	    	objs[2] = tenderingheadinfoList.get(i).getTenderingName();
	    	objs[3] = tenderingheadinfoList.get(i).getPlanMoney();
	    	objs[4] = tenderingheadinfoList.get(i).getEstimateMoeny();
	    	objs[5] = dateToStr(tenderingheadinfoList.get(i).getBuyStart());
	    	objs[6] = dateToStr(tenderingheadinfoList.get(i).getBuyEnd());
	    	objs[7] = dateToStr(tenderingheadinfoList.get(i).getStartTime());
	    	objs[8] = dateToStr(tenderingheadinfoList.get(i).getEndTime());
	    	objs[9] = tenderingheadinfoList.get(i).getCreateUser();
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	   
	}
	 
	 //角色表的导出
	@ResponseBody
	@RequestMapping("/xitong/role_RoleExcel2")
	public void roleExportExcel(HttpServletRequest request,HttpServletResponse response,String expRoles) throws Exception{
		//要导出的数据
		 
		List<Role> roleList = new ArrayList<Role>();
		if(expRoles == ""){
			roleList = roleService.findRoleAll();
		}else{
			String[] roles = expRoles.split(",");
			for(String roleName:roles){
				roleName = new String (roleName.getBytes("ISO8859-1"),"UTF-8");				 				 
				Role role = roleService.selectRoleByRoleName(roleName);
				roleList.add(role);
			}
		}	
		 
	    //导出文件的标题
	    String title = "角色维护信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","角色权限","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < roleList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = roleList.get(i).getRoleName();
	    	objs[2] = dateToStr(roleList.get(i).getCreateTime());
	    	 
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	   
	}
	//用户表导出
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping("/xitong/user_UserExcel2")
	public void userExportExcel(HttpServletRequest request,HttpServletResponse response,String expUsers) throws Exception{
		//要导出的数据
		 
		List<User> userList = new ArrayList<User>();
		if(expUsers == ""){
			userList = userService.findUserAll();
		}else{
			String[] users = expUsers.split(",");
		 
			for(String userCode:users){
				userCode = new String (userCode.getBytes("ISO8859-1"),"UTF-8");				 				 
				User user = userService.selectUserByUserCode(userCode);
				userList.add(user);
			}
		}	
		 
	    //导出文件的标题
	    String title = "人员维护信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","用户编号","用户名称","用户密码","手机号","国籍","性别","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < userList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = userList.get(i).getUserCode();
	    	objs[2] = userList.get(i).getUserName();
	    	objs[3] = userList.get(i).getUserPwd();
	    	objs[4] = userList.get(i).getUserTel();
	    	objs[5] = userList.get(i).getUserCountry();
	    	objs[6] = userList.get(i).getUserSex();
	    	objs[7] = dateToStr(userList.get(i).getCreateTime());	     	    	 	    	 
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	   
	}
	@Autowired
	private FastService fastService;
	@ResponseBody
	@RequestMapping("/xitong/fast_FastExcel2")
	public void fastExportExcel(HttpServletRequest request,HttpServletResponse response,String expFasts) throws Exception{
		//要导出的数据
		 
		List<Fast> fastList = new ArrayList<Fast>();
		if(expFasts == ""){
			fastList = fastService.selectAllFast();
		}else{
			String[] fasts = expFasts.split(",");
		 
			for(String code:fasts){
				  
				 code = new String (code.getBytes("ISO8859-1"),"UTF-8");
			 
				Fast fast = fastService.selectFastByCode(code);
				
				fastList.add(fast);
			}
		}	
		 
	    //导出文件的标题
	    String title = "快码表信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","类型名","编码","中文名","类型中文名","创建人","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < fastList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = fastList.get(i).getFastType();
	    	objs[2] = fastList.get(i).getCode();
	    	objs[3] = fastList.get(i).getCodeName();
	    	objs[4] = fastList.get(i).getFastTypeName();
	    	objs[5] = fastList.get(i).getCreateUser();
	    	objs[6] = dateToStr(fastList.get(i).getCreateTime());     	    	 	    	 
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	   
	}
	public static String dateToStr(Date dateDate) {
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = smf.format(dateDate);
		return dateString;
	}
	
	@ResponseBody
	@RequestMapping("/caigou/purchase_ReportExcel")
	public void purchase_ReportExcel(HttpServletRequest request,HttpServletResponse response,int[] expPurs) throws Exception{
		//要导出的数据
		ArrayList<PurchaseCustom> purchaseHeadList = new ArrayList<PurchaseCustom>();
		if(expPurs[0] == 0){
			purchaseHeadList = purchaseService.findAllPurchaseInfo();
		}else{
			for(int id : expPurs){
				PurchaseCustom purchaseHeadInfo = purchaseService.findPurchaseInfoById(id);
				purchaseHeadList.add(purchaseHeadInfo);
			}
		}	
	    //导出文件的标题
	    String title = "采购计划头信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","采购计划编号","采购计划名称","项目编号","项目名称",
	    								"概算金额(万元)","创建人","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < purchaseHeadList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = purchaseHeadList.get(i).getPurchaseCode();
	    	objs[2] = purchaseHeadList.get(i).getPurchaseName();
	    	objs[3] = purchaseHeadList.get(i).getProjectCode();
	    	objs[4] = purchaseHeadList.get(i).getProjectName();
	    	objs[5] = purchaseHeadList.get(i).getEstimateMoney();
	    	objs[6] = purchaseHeadList.get(i).getCreateUser();
	    	objs[7] = dateToStr(purchaseHeadList.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	   
	}
	
	@ResponseBody
	@RequestMapping("/caigou/project_ReportExcel")
	public void project_ReportExcel(HttpServletRequest request,HttpServletResponse response,String expPros) throws Exception{
		//要导出的数据
		ArrayList<Project> projectList = new ArrayList<Project>();
		if(expPros == ""){
			projectList = projectService.findAllProject();
		}else{
			String[] pros = expPros.split(",");
			for(String code : pros){
				Project pro = projectService.findProByCode(code);
				projectList.add(pro);
			}
		}	
	    //导出文件的标题
	    String title = "项目信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","项目编号","项目名称","概算金额(万元)","项目经理",
	    								"项目地址","创建人","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < projectList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = projectList.get(i).getProjectCode();
	    	objs[2] = projectList.get(i).getProjectName();
	    	objs[3] = projectList.get(i).getEstimateMoney();
	    	objs[4] = projectList.get(i).getProjectManager();
	    	objs[5] = projectList.get(i).getProjectAddress();
	    	objs[6] = projectList.get(i).getCreateUser();
	    	objs[7] = dateToStr(projectList.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@ResponseBody
	@RequestMapping("/hetong/supplier_ReportExcel")
	public void supplier_ReportExcel(HttpServletRequest request,HttpServletResponse response,String expSupps) throws Exception{
		//要导出的数据
		ArrayList<Supplier> supplierList = new ArrayList<Supplier>();
		if(expSupps == ""){
			supplierList = supplierService.findAllSupplier();
		}else{
			String[] supps = expSupps.split(",");
			for(String code : supps){
				Supplier supp = supplierService.findSupByCode(code);
				supplierList.add(supp);
			}
		}	
	    //导出文件的标题
	    String title = "供应商信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","供应商编号","供应商名称","营业执照注册号","组织机构代码",
	    								"税务登记证(国税)","税务登记证(地税)","创建人","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < supplierList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = supplierList.get(i).getSupplierCode();
	    	objs[2] = supplierList.get(i).getSupplieName();
	    	objs[3] = supplierList.get(i).getLicense();
	    	objs[4] = supplierList.get(i).getOrganiztion();
	    	objs[5] = supplierList.get(i).getStateTax();
	    	objs[6] = supplierList.get(i).getLandTax();
	    	objs[7] = supplierList.get(i).getCreateUser();
	    	objs[8] = dateToStr(supplierList.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@ResponseBody
	@RequestMapping("/zhaobiao/bidding_ReportExcel")
	public void bidding_ReportExcel(HttpServletRequest request,HttpServletResponse response,int[] expBids) throws Exception{
		//要导出的数据
		ArrayList<BiddingPlanCustom> biddingList = new ArrayList<BiddingPlanCustom>();
		if(expBids[0] == 0){
			biddingList = biddingPlanService.findAllBidPlan();
		}else{
			for(int id : expBids){
				BiddingPlanCustom bid = biddingPlanService.findBidById(id);
				biddingList.add(bid);
			}
		}	
	    //导出文件的标题
	    String title = "招标方案信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","招标方案名称","招标编号","招标名称","概算总金额(万元)",
	    								"发标日期","开标日期","创建人","创建时间"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < biddingList.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = biddingList.get(i).getBiddingName();
	    	objs[2] = biddingList.get(i).getTenderingCode();
	    	objs[3] = biddingList.get(i).getTenderingName();
	    	objs[4] = biddingList.get(i).getEstimateMoeny();
	    	objs[5] = dateToStr(biddingList.get(i).getStartTime());
	    	objs[6] = dateToStr(biddingList.get(i).getEndTime());
	    	objs[7] = biddingList.get(i).getCreateUser();
	    	objs[8] = dateToStr(biddingList.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@ResponseBody
	@RequestMapping("/htgl/htgl_ReportExcel")
	public void htgl_ReportExcel(HttpServletRequest request,HttpServletResponse response,int[] expPurs) throws Exception{
		//要导出的数据
		ArrayList<Contractheadinfo> contractheadinfos = new ArrayList<Contractheadinfo>();
		if(expPurs[0] == 0){
			contractheadinfos = htgl_htglService.allContractEnquiry();
		}else{
			for(int id : expPurs){
				Contractheadinfo contractheadinfo = htgl_htglService.queryContractById(id);
				contractheadinfos.add(contractheadinfo);
			}
		}	
	    //导出文件的标题
	    String title = "合同头信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","合同编号","合同名称","所属单位","供应商",
	    								"招标编号","合同类型","合同金额(万元)","币种",
	    								"合同期限","提交日期"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < contractheadinfos.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = contractheadinfos.get(i).getContractCode();
	    	objs[2] = contractheadinfos.get(i).getContractName();
	    	objs[3] = contractheadinfos.get(i).getCompanyName();
	    	objs[4] = contractheadinfos.get(i).getSupplier().getSupplieName();
	    	objs[5] = contractheadinfos.get(i).getTenderingheadinfo().getTenderingCode();
	    	objs[6] = contractheadinfos.get(i).getContractType();
	    	objs[7] = contractheadinfos.get(i).getContractMoney();
	    	objs[8] = contractheadinfos.get(i).getMoneyType();
	    	objs[9] = dateToStr(contractheadinfos.get(i).getStartTime())+"至"+dateToStr(contractheadinfos.get(i).getEndTime());
	    	objs[10] = dateToStr(contractheadinfos.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@ResponseBody
	@RequestMapping("/xtgl/material_ReportExcel")
	public void material_ReportExcel(HttpServletRequest request,HttpServletResponse response,int[] expPurs) throws Exception{
		//要导出的数据
		ArrayList<Material> materials = new ArrayList<Material>();
		if(expPurs[0] == 0){
			materials = xtgl_wzzsjService.queryAllMaterialList();
		}else{
			for(int id : expPurs){
				Material material = xtgl_wzzsjService.queryMaterialById(id);
				materials.add(material);
			}
		}	
	    //导出文件的标题
	    String title = "物资信息"+System.currentTimeMillis()+".xlsx";
	    //设置表格标题行
	    String[] headers = new String[] {"序号","物资编码/设备编码","物资名称/设备名称","单位","标准/图号",
	    								"概算单价(元)","更新日期"};
	    List<Object[]> dataList = new ArrayList<Object[]>();
	    Object[] objs = null;
	    for (int i = 0; i < materials.size(); i++) {
	    	objs = new Object[headers.length];
	    	objs[0] = 0;//设置序号,在工具类中会出现
	    	objs[1] = materials.get(i).getMaterialCode();
	    	objs[2] = materials.get(i).getMaterialName();
	    	objs[3] = materials.get(i).getMaterialUnit();
	    	objs[4] = materials.get(i).getStandard();
	    	objs[5] = materials.get(i).getEstimateMoney();
	    	objs[6] = dateToStr(materials.get(i).getCreateTime());
	    	dataList.add(objs);//数据添加到excel表格
	    }
	      //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();    
            out.close();    
          } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
