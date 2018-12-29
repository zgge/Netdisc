package service;

import java.util.List;

import pojo.DownloadTask;

public interface DownloadTaskService {
	int addTask(DownloadTask task);
	int deleteTask();
	List<DownloadTask> getList(int userid);
}
