package pojo;

import org.springframework.web.multipart.MultipartFile;

public class UploadResourceFile {
	MultipartFile resourceFile;

	public MultipartFile getResourceFile() {
		return resourceFile;
	}

	public void setResourceFile(MultipartFile resourceFile) {
		this.resourceFile = resourceFile;
	}

}
