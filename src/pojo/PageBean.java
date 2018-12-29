package pojo;

import org.springframework.stereotype.Component;

@Component("pageBean")
public class PageBean {
	private int currentPage;
	private int totalPage;
	private int totalNum;
	private int firstPage;
	private int father;
	private int is_folder;
	public int getIs_folder() {
		return is_folder;
	}
	public void setIs_folder(int is_folder) {
		this.is_folder = is_folder;
	}
	public int getFather() {
		return father;
	}
	public void setFather(int father) {
		this.father = father;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	
}