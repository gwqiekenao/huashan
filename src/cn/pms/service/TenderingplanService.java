package cn.pms.service;

import java.util.List;

import cn.pms.pojo.Material;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;
import cn.pms.pojo.Supplier;
import cn.pms.pojo.Tenderingplan;

public interface TenderingplanService {
	//根据Tenderingheadinfo.id 找 tenderingHeadId查询
	public List<Tenderingplan> selectTenderingplanById(Integer id);
	//(根据id查)采购头的结果集	
	public Purchaseheadinfo selectPurchaseheadinfoById(Integer id);
	//(根据id查)采购行的结果集 
	public Purchaseplan selectPurchaseplanById(Integer id);
	//(根据id查)采购行的物质id查结果集 
	public Material selectMaterialById(Integer id);
	//查询所有供应商
	public List<Supplier> selectSupplier();
	public List<Integer> selectZbandgyById(Integer id);
	public Supplier selectSupplierById(Integer id);
	//新增招标行
	public void insertTenderingplan(Tenderingplan tenderingplan);
	//修改招标行
	public void updateTenderingplan(Tenderingplan tenderingplan);
	//修改采购行的可用数量
	public void updateUseNumber(PurchaseplanCustom purchaseplanCustom);
	//删除要修改的招标行
	public void updateDelTenderPlan(Tenderingplan tenderingplan);
}
