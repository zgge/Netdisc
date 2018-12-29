package mapper;

import java.util.List;

import pojo.DownloadTask;

public interface DownloadTaskMapper {
	int addTask(DownloadTask task);
	int deleteTask();
	int updateTask(DownloadTask task);
	List<DownloadTask> getList(int userid);
}
