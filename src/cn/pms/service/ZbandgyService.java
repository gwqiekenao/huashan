package cn.pms.service;

import java.util.List;
import cn.pms.pojo.Zbandgy;

public interface ZbandgyService {
	//修改供应商与招标的关系
	public void updateSupplierAnd(Zbandgy zbandgy);
	public List<Zbandgy> findZbandgyById(Integer id);
	public void deleteZbandgy(Integer id);
	public void insertSupplierAnd(Zbandgy zbandgy);
	
}
