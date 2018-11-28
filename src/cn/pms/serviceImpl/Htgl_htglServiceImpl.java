package cn.pms.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.hetong.ContractheadinfoMapper;
import cn.pms.pojo.Contractheadinfo;
import cn.pms.pojo.Contractinfo;
import cn.pms.pojo.DateConveter;
import cn.pms.pojo.Material;
import cn.pms.pojo.Page;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.QueryVo;
import cn.pms.pojo.Supplier;
import cn.pms.pojo.Tenderingheadinfo;
import cn.pms.pojo.User;
import cn.pms.service.Htgl_htglService;


@Service
public class Htgl_htglServiceImpl implements Htgl_htglService{

	@Autowired
	private ContractheadinfoMapper contractheadinfoMapper;
		
//招标编号查询
	public Page<Tenderingheadinfo> queryTenderingList(QueryVo vo) {
		Page<Tenderingheadinfo> tenderPage = new Page<Tenderingheadinfo>();
		if (null != vo) {
			//每页显示条数
			tenderPage.setSize(vo.getSize());
			//判断当前页
			if(null != vo.getPage()) {
				tenderPage.setPage(vo.getPage());
				if(vo.getPage() == 0) {
					vo.setStartRow(0);
				}else {
				vo.setStartRow((vo.getPage() - 1)*tenderPage.getSize());
				}
			}
			//设置总条数,结果集
			tenderPage.setTotal(contractheadinfoMapper.tenderCountByQueryVo(vo));
			tenderPage.setRows(contractheadinfoMapper.tenderNumberEnquiry(vo));
		}
		return tenderPage;
	}

	//查询合同分页对象
	public Page<Contractheadinfo> queryContractByVo(QueryVo vo) {
		Page<Contractheadinfo> ContractPage = new Page<Contractheadinfo>();
		//判断当前页
		if (null != vo) {
			//每页显示条数
			if (vo.getSize() == null) {
				vo.setSize(5);
				ContractPage.setSize(vo.getSize());
			}else {
				ContractPage.setSize(vo.getSize());
			}
			//判断当前页
			if(null != vo.getPage()) {
				ContractPage.setPage(vo.getPage());
				if(vo.getPage() == 0) {
					vo.setStartRow(0);
				}else {
					vo.setStartRow((vo.getPage() - 1)*ContractPage.getSize());
				}
			}
			//日期转换器
			String startTime2 = vo.getStartTime() + " 00:00:00";
			String endTime2 = vo.getEndTime() + " 00:00:00";
			DateConveter dateConveter = new DateConveter();
			Date startTime = dateConveter.convert(startTime2);
			Date endTime = dateConveter.convert(endTime2);
			vo.setStartTime1(startTime);
			vo.setEndTime1(endTime);
			
			//设置总条数,结果集
			ContractPage.setTotal(contractheadinfoMapper.contractCountByQueryVo(vo));
			ContractPage.setRows(contractheadinfoMapper.contractEnquiry(vo));
		}
		return ContractPage;
	}
	
	//通过id查合同头表
	public Contractheadinfo queryContractById(Integer id) {
		return contractheadinfoMapper.contractQueryById(id);
	}
	
	//通过tenderingHeadInfoId查招标头,行
	public List<Tenderingheadinfo> queryTenderInfo(Integer tenderingHeadInfoId) {
		return contractheadinfoMapper.queryTenderInfo(tenderingHeadInfoId);
	}
		
	//查采购头,行
	public List<Purchaseheadinfo> queryPurchaseInfo(Integer tenderingHeadInfoId) {
		//传入tenderingHeadInfoId先查到招标表里的采购头,再调用带采购头id参数mapper方法
		List<Tenderingheadinfo> tenderHeadInfoList = contractheadinfoMapper.queryTenderInfo(tenderingHeadInfoId);
		Integer purchaseId = tenderHeadInfoList.get(0).getPurchaseId();
		return contractheadinfoMapper.queryPurchaseInfo(purchaseId);
	}
			
	//查询所有物质信息
	public List<Material> queryMaterial() {
		return contractheadinfoMapper.queryAllMaterial();
	}
	
	//通过contractCode查合同行信息
	public Contractinfo queryContractLine(String contractCode) {
		return contractheadinfoMapper.contractLineQueryByCode(contractCode);
	}
	
	//修改页面经办人查询
	public Page<User> queryUserList(QueryVo vo) {
		Page<User> userPage = new Page<User>();
		//判断当前页
		if (null != vo) {
			//每页显示条数
			userPage.setSize(vo.getSize());
			//判断当前页
			if(null != vo.getPage()) {
				userPage.setPage(vo.getPage());
				if(vo.getPage() == 0) {
					vo.setStartRow(0);
				}else {
					vo.setStartRow((vo.getPage() - 1)*userPage.getSize());
				}
			}
			//设置总条数,结果集
			userPage.setTotal(contractheadinfoMapper.queryUserTotal(vo));
			userPage.setRows(contractheadinfoMapper.queryUserPageList(vo));
		}
		return userPage;
	}

	//提交合同头修改
	public void updateContractHead(Contractheadinfo contractheadinfo) {
		contractheadinfoMapper.updateContractHead(contractheadinfo);
	}

	//提交合同文件信息
	public void updateContractInfo(Contractinfo contractinfo) {
		contractheadinfoMapper.updateContractInfo(contractinfo);
	}

	//查找合同经办人信息
	public User queryUserInfoById(Integer userId) {
		return contractheadinfoMapper.queryUserInfoById(userId);
	}

	//新增页面供应商查询
	public Page<Supplier> querySupplier(QueryVo vo) {
		Page<Supplier> supplierPage = new Page<Supplier>();
		if (null != vo) {
			//每页显示条数
			supplierPage.setSize(vo.getSize());
			//判断当前页
			if(null != vo.getPage()) {
				supplierPage.setPage(vo.getPage());
				if(vo.getPage() == 0) {
					vo.setStartRow(0);
				}else {
					vo.setStartRow((vo.getPage() - 1)*supplierPage.getSize());
				}
			}
			//设置总条数,结果集
			supplierPage.setTotal(contractheadinfoMapper.supplierCountByQueryVo(vo));
			supplierPage.setRows(contractheadinfoMapper.supplierInfoByQueryVo(vo));
		}
		return supplierPage;
	}

	//新增合同头表
	public void appendContractHeadInfo(Contractheadinfo contractheadinfo) {
		contractheadinfoMapper.appendContractHeadInfo(contractheadinfo);
	}

	//新增合同行表
	public void appendContractInfo(Contractinfo contractinfo) {
		contractheadinfoMapper.appendContractInfo(contractinfo);
	}

	//合同删除
	public void contractDelete(Integer id) {
		contractheadinfoMapper.contractDelete(id);
	}

	//批量删除
	public void contractDels(Integer[] ids) {
		for(int i = 0; i < ids.length; i++) {
			contractheadinfoMapper.contractDelete(ids[i]);
		}
	}

	@Override
	public ArrayList<Contractheadinfo> allContractEnquiry() {
		return contractheadinfoMapper.allContractEnquiry();
	}

}
