package cn.pms.pojo;

public class PageModel {
		
	private int eachPageNum;		//每页显示信息数目
	private int dataNum;			//总信息数
	private int nowPageNum;    		//当前页数  
	private int pageData;    	 	//获取当前页显示信息的序号
	private int pageCount;			//总页�?
	private int endPageData;
	public PageModel(int eachPageNum, int dataNum, int nowPageNum) {
		super();
		this.eachPageNum = eachPageNum;
		this.dataNum = dataNum;
		this.nowPageNum = nowPageNum;
		pageData=this.getPageData();
		pageCount=this.getPageCount();
		endPageData=pageData+eachPageNum;
	}
	public int getEndPageData() {
		return endPageData;
	}
	public void setEndPageData(int endPageData) {
		this.endPageData = endPageData;
	}
	public void setPageData(int pageData) {
		this.pageData = pageData;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getNowPageNum() {
		return nowPageNum;
	}
	public void setNowPageNum(int nowPageNum) {
		this.nowPageNum = nowPageNum;
	}
	public int getEachPageNum() {
		return eachPageNum;
	}
	public void setEachPageNum(int eachPageNum) {
		this.eachPageNum = eachPageNum;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	
	public int getPageCount(){			//获取总页�?
		int pageCount=dataNum/eachPageNum;
		if(dataNum%eachPageNum!=0)
			pageCount+=1;
		return pageCount;
		
	}
	
	public int getPageData(){			//获取当前页显示信息的序号
		return (nowPageNum-1)*eachPageNum;
	}

}
