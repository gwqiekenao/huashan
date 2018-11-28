package cn.pms.pojo;

import java.util.ArrayList;

public class BiddingPlanPack {
	private Biddingplan bidding;
	private ArrayList<Zbandzj> zbandzj;
	public Biddingplan getBidding() {
		return bidding;
	}
	public void setBidding(Biddingplan bidding) {
		this.bidding = bidding;
	}
	public ArrayList<Zbandzj> getZbandzj() {
		return zbandzj;
	}
	public void setZbandzj(ArrayList<Zbandzj> zbandzj) {
		this.zbandzj = zbandzj;
	}
	
}
