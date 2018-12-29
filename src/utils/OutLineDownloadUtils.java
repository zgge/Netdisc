package utils;

public class OutLineDownloadUtils {
	public  static String getName(String s) {
		String name=s.substring(s.indexOf("filename=")+10,s.lastIndexOf("\""));
		return name;
	}
}
