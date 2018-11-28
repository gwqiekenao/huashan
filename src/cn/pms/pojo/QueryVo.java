package cn.pms.pojo;

import java.util.Date;

public class QueryVo {
	
	private String contractCode;//合同编号
	private String contractName;//合同名称
	private String tenderingCode;//招标编号
	private String startTime;//合同期限头
	private String endTime;//合同期限尾
	private String supplieName;//供应商名称
	private String companyName;//所属单位
	private String contractType;//合同类型
	private Date startTime1;//日期类型合同期限头
	private Date endTime1;//日期类型合同期限尾
	
	private String tenderingName;//招标名称
	
	private String materialCode;//物资编号
	private String materialName;//物资名称
	private String materialType;//物资类型
	private Integer keyMaterial;//关键物资
	
	private String userCode;//用户编号
	private String userName;//用户名称
	
	private String supplierCode;//供应商编号
	
	//当前页
	private Integer page;
	//每页数
	private Integer size;
	//开始行
	private Integer startRow = 0;
	//总页数
	private Integer totalPages;
	
	
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public Integer getKeyMaterial() {
		return keyMaterial;
	}
	public void setKeyMaterial(Integer keyMaterial) {
		this.keyMaterial = keyMaterial;
	}
	public Date getStartTime1() {
		return startTime1;
	}
	public void setStartTime1(Date startTime1) {
		this.startTime1 = startTime1;
	}
	public Date getEndTime1() {
		return endTime1;
	}
	public void setEndTime1(Date endTime1) {
		this.endTime1 = endTime1;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public String getTenderingCode() {
		return tenderingCode;
	}
	public void setTenderingCode(String tenderingCode) {
		this.tenderingCode = tenderingCode;
	}
	public String getTenderingName() {
		return tenderingName;
	}
	public void setTenderingName(String tenderingName) {
		this.tenderingName = tenderingName;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getContractName() {
		return contractName;
	}
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	public String getSupplieName() {
		return supplieName;
	}
	public void setSupplieName(String supplieName) {
		this.supplieName = supplieName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContractType() {
		return contractType;
	}
	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
