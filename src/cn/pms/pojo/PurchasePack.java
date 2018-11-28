package cn.pms.pojo;

import java.util.ArrayList;

public class PurchasePack {
	Purchaseheadinfo purchaseHead;
	ArrayList<Purchaseplan> purchasePlans;
	public Purchaseheadinfo getPurchaseHead() {
		return purchaseHead;
	}
	public void setPurchaseHead(Purchaseheadinfo purchaseHead) {
		this.purchaseHead = purchaseHead;
	}
	public ArrayList<Purchaseplan> getPurchasePlans() {
		return purchasePlans;
	}
	public void setPurchasePlans(ArrayList<Purchaseplan> purchasePlans) {
		this.purchasePlans = purchasePlans;
	}
	
	
}
