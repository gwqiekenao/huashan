package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.hetong.SupplierMapper;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Supplier;
import cn.pms.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	SupplierMapper supplierMapper;
	@Override
	public ArrayList<Supplier> findSupplier(PageModel pageModel, String supplierCode, String supplierName,
			String supplierType) {
		return supplierMapper.findSupplier(pageModel, supplierCode, supplierName, supplierType);
	}

	@Override
	public int getCount(String supplierCode, String supplierName, String supplierType) {
		return supplierMapper.getCount(supplierCode, supplierName, supplierType);
	}

	@Override
	public Supplier findSupByCode(String supplierCode) {
		return supplierMapper.findSupByCode(supplierCode);
	}

	@Override
	public int deleteSupplier(String[] codes) {
		return supplierMapper.deleteSupplier(codes);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		return supplierMapper.updateSupplier(supplier);
	}

	@Override
	public int insertSupplier(Supplier supplier) {
		return supplierMapper.insertSupplier(supplier);
	}

	@Override
	public ArrayList<Supplier> findAllSupplier() {
		return supplierMapper.findAllSupplier();
	}
	
}
