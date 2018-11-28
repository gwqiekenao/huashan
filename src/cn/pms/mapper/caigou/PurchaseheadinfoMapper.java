package cn.pms.mapper.caigou;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.PurchaseCustom;
import cn.pms.pojo.Purchaseheadinfo;
import cn.pms.pojo.Purchaseplan;

public interface PurchaseheadinfoMapper {
	public int getCount(PurchaseCustom purchaseCustom);
	
	public ArrayList<PurchaseCustom> findPurchaseInfo(PurchaseCustom purchaseCustom);
	
	public PurchaseCustom findPurchaseInfoById(int id);
	
	public int deletePurchases(@Param("codes")String[] codes);
	
	public int updatePurHead(Purchaseheadinfo purchaseHead);
	
	public int insertPurHead(Purchaseheadinfo purchaseHead);
	
	public ArrayList<PurchaseCustom> findAllPurchaseInfo();
}