package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.PageModel;
import cn.pms.pojo.Supplier;

public interface SupplierService {
	public ArrayList<Supplier> findSupplier(PageModel pageModel,String supplierCode,
			                               String supplierName,String supplierType);
	
	public int getCount(String supplierCode,String supplierName,String supplierType);
	
	public Supplier findSupByCode(String supplierCode);
	
	public int deleteSupplier(String[] codes);
	
	public int updateSupplier(Supplier supplier);
	
	public int insertSupplier(Supplier supplier);
	
	public ArrayList<Supplier> findAllSupplier();
}
