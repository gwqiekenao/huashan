package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.caigou.PurchaseheadinfoMapper;
import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.service.PurchaseService;
@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseheadinfoMapper purchaseheadinfoMapper;

	@Override
	public int getCount(PurchaseCustom purchaseCustom) {
		return purchaseheadinfoMapper.getCount(purchaseCustom);
	}

	@Override
	public ArrayList<PurchaseCustom> findPurchaseInfo(PurchaseCustom purchaseCustom) {
		return purchaseheadinfoMapper.findPurchaseInfo(purchaseCustom);
	}

	@Override
	public PurchaseCustom findPurchaseInfoById(int id) {
		return purchaseheadinfoMapper.findPurchaseInfoById(id);
	}

	@Override
	public int deletePurchases(String[] codes) {
		return purchaseheadinfoMapper.deletePurchases(codes);
	}

	@Override
	public int updatePurHead(Purchaseheadinfo purchaseHead) {
		return purchaseheadinfoMapper.updatePurHead(purchaseHead);
	}

	@Override
	public int insertPurHead(Purchaseheadinfo purchaseHead) {
		return purchaseheadinfoMapper.insertPurHead(purchaseHead);
	}

	@Override
	public ArrayList<PurchaseCustom> findAllPurchaseInfo() {
		return purchaseheadinfoMapper.findAllPurchaseInfo();
	}
	
	
	
}
