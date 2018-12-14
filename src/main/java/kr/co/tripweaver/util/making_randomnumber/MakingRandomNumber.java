package kr.co.tripweaver.util.making_randomnumber;

import java.util.Random;

import org.springframework.stereotype.Service;

/**
* MakingRandomNumber.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 13.
* @see
* 
* << 클래스 생성 목적 >>
* 
* 난수를 만들거나 암호화를 할때 사용하는 클래스
*
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@Service
public class MakingRandomNumber {
	
	/**
	* Method : makingRandomFileName
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 13.
	* 변경이력 :
	* @return
	* Method 설명 :
	*/
	public String makingRandomFileName() {
		
		int randomNumber = new Random().nextInt(3000000);
		
		String randomNumberString = Integer.toString(randomNumber);
		
		return null;
	}
	
}
