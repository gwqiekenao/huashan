package cn.pms.mapper.hetong;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Supplier;

public interface SupplierMapper {
	public ArrayList<Supplier> findSupplier(@Param("pageModel")PageModel pageModel,
			@Param("supplierCode")String supplierCode,@Param("supplierName")String supplierName,
			@Param("supplierType")String supplierType);
	
	public int getCount(@Param("supplierCode")String supplierCode,@Param("supplierName")String supplierName,
			@Param("supplierType")String supplierType);
	
	public Supplier findSupByCode(String supplierCode);
	
	public int deleteSupplier(@Param("codes")String[] codes);
	
	public int updateSupplier(Supplier supplier);
	
	public int insertSupplier(Supplier supplier);
	
	public ArrayList<Supplier> findAllSupplier();
}