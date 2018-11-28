package cn.pms.service;

import java.util.ArrayList;
import java.util.List;

import cn.pms.pojo.Contractheadinfo;
import cn.pms.pojo.Contractinfo;
import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.QueryVo;
import cn.pms.pojo.Supplier;
import cn.pms.pojo.Tenderingheadinfo;
import cn.pms.pojo.User;


public interface Htgl_htglService {
	

//	//招标编号查询
	public Page<Tenderingheadinfo> queryTenderingList(QueryVo vo);
//
//	//查询合同分页对象
	public Page<Contractheadinfo> queryContractByVo(QueryVo vo);

	public ArrayList<Contractheadinfo> allContractEnquiry();
	
//	//通过id查合同头表
	public Contractheadinfo queryContractById(Integer id);

//	//通过tenderingHeadInfoId查招标头,行
	public List<Tenderingheadinfo> queryTenderInfo(Integer tenderingHeadInfoId);
//
//	//查采购头,行,项目
	public List<Purchaseheadinfo> queryPurchaseInfo(Integer tenderingHeadInfoId);
//
//	//查询所有物质信息
	public List<Material> queryMaterial();
	
	//通过id查合同行信息
	public Contractinfo queryContractLine(String contractCode);

//	//修改页面经办人查询
	public Page<User> queryUserList(QueryVo vo);
	
	//提交合同头修改
	public void updateContractHead(Contractheadinfo contractheadinfo);
	
	//提交合同信息
	public void updateContractInfo(Contractinfo contractinfo);
	
	//查找合同经办人信息
	public User queryUserInfoById(Integer userId);
	
	//新增页面供应商查询
	public Page<Supplier> querySupplier(QueryVo vo);
	
	//新增合同头表
	public void appendContractHeadInfo(Contractheadinfo contractheadinfo);
	
	//新增合同行表
	public void appendContractInfo(Contractinfo contractinfo);
	
	//合同删除
	public void contractDelete(Integer id);
	
	//批量删除
	public void contractDels(Integer[] ids);
	}
