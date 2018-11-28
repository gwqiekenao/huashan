package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.Purchaseheadinfo;

public interface PurchaseService {
	public int getCount(PurchaseCustom purchaseCustom);
	
	public ArrayList<PurchaseCustom> findPurchaseInfo(PurchaseCustom purchaseCustom);
	
	public PurchaseCustom findPurchaseInfoById(int id);
	
	public int deletePurchases(String[] codes);
	
	public int updatePurHead(Purchaseheadinfo purchaseHead);
	
	public int insertPurHead(Purchaseheadinfo purchaseHead);
	
	public ArrayList<PurchaseCustom> findAllPurchaseInfo();
}
