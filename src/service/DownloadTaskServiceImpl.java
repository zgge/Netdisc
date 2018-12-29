package service;

import java.io.File;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import mapper.DownloadTaskMapper;
import mapper.SourceMapper;
import pojo.DownloadTask;
import pojo.Resource;
@Service
public class DownloadTaskServiceImpl implements DownloadTaskService{
	@Autowired
	DownloadTaskMapper mapper;
	@Autowired
	SourceMapper smapper;
	@Autowired
	Resource resource;
	@Override
	public int addTask(DownloadTask task) {
		int r= mapper.addTask(task);
		Timer timer=new Timer();
		timer.schedule(new TimerTask() {

			@Override
			public void run() {
				File file=new File(task.getSavepath());
				if(!file.exists()) {
					System.out.println("不存在");
					timer.cancel();
				}
				double length=file.length();
				double size=task.getFilesize();
				double loading=length/size;
				task.setLoading(loading);
				mapper.updateTask(task);
				System.out.println("更新完成:filesize:"+file.length());
				if(task.getLoading()==1) {
					resource.setCatalog("其他");
					resource.setCount(0);
					resource.setFilename(task.getFilename());
					resource.setFilesize(task.getFilesize());
					resource.setFiletype("未知");
					resource.setIs_share("0");
					resource.setMemo("");
					resource.setSavepath(task.getSavepath());
					resource.setUid(task.getUserid());
					resource.setUploaddate(task.getUploaddate());
					resource.setFather(0);
					resource.setIs_folder(0);
					smapper.add(resource);
					mapper.deleteTask();
					System.out.println("等于一");
					timer.cancel();
				}
			}}, 3000,3000);
		return r;
	}

	@Override
	public int deleteTask() {
		// TODO Auto-generated method stub
		return mapper.deleteTask();
	}


	@Override
	public List<DownloadTask> getList(int userid) {
		List<DownloadTask> list=mapper.getList(userid);
		return list;
	}

}
