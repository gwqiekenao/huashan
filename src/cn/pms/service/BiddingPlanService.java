package cn.pms.service;

import java.util.ArrayList;

import cn.pms.pojo.BiddingPlanCustom;
import cn.pms.pojo.Biddingplan;
import cn.pms.pojo.Expert;
import cn.pms.pojo.PageModel;
import cn.pms.pojo.Zbandzj;

public interface BiddingPlanService {
	public int getCount(String tenderingCode,String tenderingName,String biddingName);
	   
	   public ArrayList<BiddingPlanCustom> findBidPlan(PageModel pageModel,String tenderingCode,
			   String tenderingName,String biddingName);
	   
	   public int deleteBidding(int[] ids);
	   
	   public BiddingPlanCustom findBidById(int id);
	   
	   public ArrayList<Expert> findExpert(int biddingId);
	   
	   public int insertBidding(Biddingplan bidding);
	   
	   public int insert(Zbandzj z);
	   
	   public int delete(int biddingId,int expertId);
	   
	   public int updateBidding(Biddingplan bidding);
	   
	   public ArrayList<BiddingPlanCustom> findAllBidPlan();
}
