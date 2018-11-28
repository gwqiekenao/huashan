package cn.pms.mapper.hetong;

import java.util.ArrayList;
import java.util.List;
import cn.pms.pojo.*;

public interface ContractheadinfoMapper {
	

	//招标编号查询
	public List<Tenderingheadinfo> tenderNumberEnquiry(QueryVo vo);
		
	//招标编号总条数
	public Integer tenderCountByQueryVo(QueryVo vo);

	//合同总条数
	public Integer contractCountByQueryVo(QueryVo vo);

	//合同分页对象
	public List<Contractheadinfo> contractEnquiry(QueryVo vo);
	
	public ArrayList<Contractheadinfo> allContractEnquiry();

	//通过id查合同头表
	public Contractheadinfo contractQueryById(Integer id);
	
	//通过tenderingHeadInfoId查招标头,行
	public List<Tenderingheadinfo> queryTenderInfo(Integer tenderingHeadInfoId);
	
	//查采购头,行,项目表
	public List<Purchaseheadinfo> queryPurchaseInfo(Integer purchaseId);
	
	//查询所有物质信息
	public List<Material> queryAllMaterial();
	
	//通过id查合同行信息wwwwwwwwwwww
	public Contractinfo contractLineQueryByCode(String id);
	
	//查询user分页对象
	public List<User> queryUserPageList(QueryVo vo);

	//查询user中条数
	public int queryUserTotal(QueryVo vo);
	
	//提交合同头修改
	public void updateContractHead(Contractheadinfo contractheadinfo);

	//提交合同文件信息
	public void updateContractInfo(Contractinfo contractinfo);

	//查找合同经办人信息
	public User queryUserInfoById(Integer userId);

	//查找供应商条数
	public int supplierCountByQueryVo(QueryVo vo);

	//查找供应商信息
	public List<Supplier> supplierInfoByQueryVo(QueryVo vo);

	//新增合同头表
	public void appendContractHeadInfo(Contractheadinfo contractheadinfo);

	//新增合同行表
	public void appendContractInfo(Contractinfo contractinfo);

	//合同删除
	public void contractDelete(Integer id);
	
	

}