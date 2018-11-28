package cn.pms.serviceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pms.mapper.caigou.PurchaseplanMapper;
import cn.pms.pojo.Purchaseplan;
import cn.pms.pojo.PurchaseplanCustom;
import cn.pms.service.PurchasePlanService;

@Service
public class PurchasePlanServiceImpl implements PurchasePlanService{

	@Autowired
	PurchaseplanMapper purchaseplanMapper;
	
	@Override
	public ArrayList<PurchaseplanCustom> findPurchasePlan(int purchaseId) {
		return purchaseplanMapper.findPurchasePlan(purchaseId);
	}

	@Override
	public int updatePurPlan(Purchaseplan purPlan) {
		return purchaseplanMapper.updatePurPlan(purPlan);
	}

	@Override
	public int deletePurPlan(int[] ids) {
		return purchaseplanMapper.deletePurPlan(ids);
	}

	@Override
	public int insertPurPlan(Purchaseplan purPlan) {
		return purchaseplanMapper.insertPurPlan(purPlan);
	}

}
