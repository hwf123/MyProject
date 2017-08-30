package com.rimi.bean;

public class PageBean {
	private String nowPage;//首页
	private String count;//总数据数
	private String pageSize;//每页显示五条
	private String totalPage;//总页数
	public String getNowPage() {
		return nowPage;
	}
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public String getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}
	public PageBean(String nowPage, String count, String pageSize, String totalPage) {
		super();
		this.nowPage = nowPage;
		this.count = count;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
	}
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
