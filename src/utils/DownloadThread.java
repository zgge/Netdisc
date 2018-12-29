package utils;

import java.io.File;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;

class DownloadThread extends Thread{
	private int threadId;
	private int endThread;
	private int startThread;
	private String save;
	private String path;
	DownloadThread(int threadId,int endThread,int startThread,long stime,String save,String path)
	{
		this.threadId=threadId;
		this.endThread=endThread;
		this.startThread=startThread;
		this.save=save;
		this.path=path;
	}
	public void run(){
		try {
			URL url=new URL(path);
			HttpURLConnection connection =(HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(1000*10);
			connection.setRequestProperty("Range", "bytes="+startThread+"-" + endThread);//不能用bytes:，这样获取的是整个文件
			if(connection.getResponseCode()==206){      //部分响应完成码为206
				InputStream input=connection.getInputStream();
				RandomAccessFile raf=new RandomAccessFile(new File("D:/catch/"+save),"rw");
				raf.seek(startThread);
				System.out.println("线程"+threadId+"在位置"+startThread+"写入");
				byte[] buffer=new byte[1024*10];
				int length=-1;//记录每次写入的大小
				while((length=input.read(buffer))!=-1) {
					raf.write(buffer,0,length);
				}
				raf.close();
				input.close();
				System.out.println("线程"+threadId+"下载完毕");
			}
		} catch(Exception e) {
			e.printStackTrace();
			}
		super.run();
	}
	public static String getName(String str)
	{
		String filename=str.substring(str.lastIndexOf("/")+1);
		return filename;
	}
}
