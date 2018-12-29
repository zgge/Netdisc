package pojo;

import org.springframework.stereotype.Component;

@Component("resource")
public class Resource {
	private Integer id;
	private String filename;
	private String savepath;
	private Double filesize;
	private String catalog;
	private String filetype;
	private String memo;
	private String is_share;
	private Integer uid;
	private String uploaddate;
	private Integer count;
	private Integer is_folder;
	private Integer father;
	public Integer getFather() {
		return father;
	}
	public void setFather(Integer father) {
		this.father = father;
	}
	public Integer getIs_folder() {
		return is_folder;
	}
	public void setIs_folder(Integer is_folder) {
		this.is_folder = is_folder;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	public String getCatalog() {
		return catalog;
	}
	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getIs_share() {
		return is_share;
	}
	public void setIs_share(String is_share) {
		this.is_share = is_share;
	}
	public Double getFilesize() {
		return filesize;
	}
	public void setFilesize(Double filesize) {
		this.filesize = filesize;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getId() {
		return id;
	}
	public Integer getCount() {
		return count;
	}
	@Override
	public String toString() {
		return "Resource [id=" + id + ", filename=" + filename + ", savepath=" + savepath + ", filesize=" + filesize
				+ ", catalog=" + catalog + ", filetype=" + filetype + ", memo=" + memo + ", is_share=" + is_share
				+ ", uid=" + uid + ", uploaddate=" + uploaddate + ", count=" + count + "]";
	}
	
}
