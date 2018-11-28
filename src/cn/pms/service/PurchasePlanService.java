package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;

public interface PurchasePlanService {
	public ArrayList<PurchaseplanCustom> findPurchasePlan(int purchaseId);
	
	public int updatePurPlan(Purchaseplan purPlan);
	
	public int deletePurPlan(int[] ids);
	
	public int insertPurPlan(Purchaseplan purPlan);
}
