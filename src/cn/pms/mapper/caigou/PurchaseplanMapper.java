package cn.pms.mapper.caigou;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;

public interface PurchaseplanMapper {
	public ArrayList<PurchaseplanCustom> findPurchasePlan(int purchaseId);
	
	public int updatePurPlan(Purchaseplan purPlan);
	
	public int deletePurPlan(@Param("ids")int[] ids);
	
	public int insertPurPlan(Purchaseplan purPlan);
}