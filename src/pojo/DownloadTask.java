package pojo;

import org.springframework.stereotype.Component;
@Component("downloadTask")
public class DownloadTask {
	private Integer id;
	private Integer userid;
	@Override
	public String toString() {
		return "DownloadTask [id=" + id + ", userid=" + userid + ", filename=" + filename + ", filesize=" + filesize
				+ ", savepath=" + savepath + ", uploaddate=" + uploaddate + ", loading=" + loading + "]";
	}
	private String filename;
	private Double filesize;
	private String savepath;
	private String uploaddate;
	private Double loading;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Double getFilesize() {
		return filesize;
	}
	public void setFilesize(Double filesize) {
		this.filesize = filesize;
	}
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public double getLoading() {
		return loading;
	}
	public void setLoading(double loading) {
		this.loading = loading;
	}

	
}
