package kr.co.tripweaver.util.file;

public class FileUtil {

	/**
	* Method : getFileExt
	* 작성자 : jin
	* 변경이력 :
	* @param fileName
	* @return
	* Method 설명 : 파일 확장자 추출
	 */
	public static String getFileExt(String fileName) {
		
//		int lastDotIndex = fileName.lastIndexOf(".");
//		String str = lastDotIndex == -1 ? "" : fileName.substring(lastDotIndex);
//		return str;
		
		String[] strArr = fileName.split("[.]");
		String result = strArr.length > 1 ? "." + strArr[strArr.length-1]  : "";
		return result;
	}
	
	/**
	* Method : tempUtil
	* 작성자 : jin
	* 변경이력 :
	* @param temp
	* @return
	* Method 설명 : 삭제할 첨부파일 명 배열로 만들어주는 메서드
	 */
	public static String[] tempUtil(String temp) {
		String[] tempList = temp.split(";");
		for(String t : tempList){
			System.out.println("t : " + t);
		}
		return tempList; 
	}

	
}
