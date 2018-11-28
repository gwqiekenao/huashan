package cn.pms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Tenderingheadinfo;

public interface TenderingheadinfoService {
	//查询招标头(招标文件)(关联user信息)
	public List<Tenderingheadinfo> selectTenderingheadinfo(PageModel pageModel,String tenderingCode, String purchaseType,String tenderingName); //得到条数
	public Integer tenderingheadinfoCount(String tenderingCode, String purchaseType,String tenderingName);//得到数量
	//查询招标头(招标文件)(根据招标头id)
	public Tenderingheadinfo selectTenderingheadinfoById(Integer id);
	//增加招标头
	public void insertTenderingheadinfo(Tenderingheadinfo tenderingheadinfo);
	//通过编码查id
	public Tenderingheadinfo findTenderingheadinfo(String tenderingCode);
	//通过id修改
	public void updateTenderingheadinfo(Tenderingheadinfo tenderingheadinfo);
	//通过id删除
	public void updateDelTenderhead(Tenderingheadinfo tenderingheadinfo);
	//查询所有招标头信息
	public List<Tenderingheadinfo> findTenderheadAll();
}
