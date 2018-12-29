package utils;

public class Edit {
	public static String simpleName(String filename) {
		if(filename.contains(".")) {
			return filename.substring(0,filename.lastIndexOf("."));
			}else {
				return filename;
			}
	}
	public static String getType(String filename) {
		if(filename.contains(".")) {
		return filename.substring(filename.lastIndexOf("."));
		}else {
			return "";
		}
	}
}
