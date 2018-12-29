package utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.UUID;
import pojo.DownloadTask;
public class Download {
	private  int threadCount=2;
	private int blocksize;
	private DownloadTask task=new DownloadTask();
	public  DownloadTask download(String p)  {
			String save;
			String path=p;
			long stime=System.currentTimeMillis();
			HttpURLConnection connection;
			try {
				connection = (HttpURLConnection)new URL(path).openConnection();
				connection.setRequestMethod("GET");
				connection.setConnectTimeout(10*1000);
				System.out.println("code:"+connection.getResponseCode());
				if(connection.getResponseCode()==201||connection.getResponseCode()==200||connection.getResponseCode()==206) {
					int len= connection.getContentLength();
					System.out.println("文件大小"+len);
					String URLname=connection.getHeaderField("Content-Disposition");
					RandomAccessFile randomaccessfile;
					if(URLname!=null) {
						String name=URLDecoder.decode(URLname,"utf-8");//把url码转换为utf-8
						String realName=OutLineDownloadUtils.getName(name);//获取文件名
						task.setFilename(realName);//设置文件名
						String uuid=UUID.randomUUID().toString();
						String saveName=uuid+Edit.getType(realName);
						task.setSavepath("D:/catch/"+saveName);//设置保存路径
						save=saveName;
						randomaccessfile=new RandomAccessFile(new File("D:/catch/"+saveName),"rw");//创建文件
						randomaccessfile.close();
					}else {
						String uuid=UUID.randomUUID().toString();
						String saveName=uuid+Edit.getType(DownloadThread.getName(path));
						task.setSavepath("D:/catch/"+saveName);//设置保存名
						task.setFilename(DownloadThread.getName(path));//设置文件名
						save=saveName;
						randomaccessfile=new RandomAccessFile(new File("D:/catch/"+saveName),"rw");
						randomaccessfile.close();
					}
					task.setFilesize((double) len);
					int startThread=0;
					int endThread=0;
					blocksize=len/threadCount;
					for(int i=0;i<threadCount;i++) {
						endThread=startThread+blocksize;
						new DownloadThread(i,endThread,startThread,stime,save,path).start();
						System.out.println("第"+i+"线程开始");
						startThread=endThread+1;
					}
					return task;
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return null;
	}
	
} 





