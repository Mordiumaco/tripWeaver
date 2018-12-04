package kr.co.tripweaver.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* MapTestController.java
*
* @author Jae Hyeon Choi
* @version 1.0
* @since 2018. 12. 3.
* @see
* 
* << 클래스 생성 목적 >>
* 
*Map 관련 테스트 목적
*
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Jae Hyeon Choi 최초 생성
*
* 
*/
@RequestMapping("mapTest")
@Controller
public class MapTestController {
	
	
	/**
	* Method : MaptestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 맵 생성 관련 뷰 
	*/
	@RequestMapping("mapGenerate")
	public String mapTestView() {
		
		return "test/map/mapGenerate";
	}
	
	
	/**
	* Method : MapMoveTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 :맵 이동 관련 테스트 뷰
	*/
	@RequestMapping("mapMove")
	public String mapMoveTestView() {
		
		return "test/map/mapMove";
	}
	
	/**
	* Method : mapLevelBasicTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 지도 확대 줌 관련 테스트 뷰
	*/
	@RequestMapping("mapLevelBasic")
	public String mapLevelBasicTestView() {
		
		return "test/map/mapLevelBasic";
	}
	
	
	/**
	* Method : mapGetInfoTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 지도 정보 얻어오기 관련 테스트 뷰 
	*/
	@RequestMapping("mapGetInfo")
	public String mapGetInfoTestView() {
		
		return "test/map/mapGetInfo";
	}
	
	/**
	* Method : mapSetBoundTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 지도 범위 재설정 테스트 뷰 
	*/
	@RequestMapping("mapSetBound")
	public String mapSetBoundTestView() {
		
		return "test/map/mapSetBound";
	}
	
	/**
	* Method : clickEventTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 맵 관련 클릭 이벤트 연습
	*/
	@RequestMapping("clickEvent")
	public String clickEventTestView() {
		
		return "test/map/clickEvent";
	}
	
	/**
	* Method : makingMarkerTestView
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 클릭할 떄 마커 생성하기 
	*/
	@RequestMapping("makingMarker")
	public String makingMarkerTestView() {
		
		return "test/map/makingMarker";
	}
	
	
	/**
	* Method : addMapDragendEvent
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 :지도를 이동할 때 발생하는 이벤트 테스트 뷰 
	*/
	@RequestMapping("addMapDragendEvent")
	public String addMapDragendEvent() {
		
		return "test/map/addMapDragendEvent";
	}
	
	
	/**
	* Method : addMapZoomChangedEvent
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 확대 축소 이벤트 등록 테스트 뷰 
	*/
	@RequestMapping("addMapZoomChangedEvent")
	public String addMapZoomChangedEvent() {
		
		return "test/map/addMapZoomChangedEvent";
	}
	
	/**
	* Method : basicMarkerImageViewTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 마커 바꾼 맵 테스트 뷰 
	*/
	@RequestMapping("basicMarkerImage")
	public String basicMarkerImageViewTest() {
		
		return "test/map/basicMarkerImage";
	}
	
	
	/**
	* Method : addTilesloadedEventViewTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 3.
	* 변경이력 :
	* @return
	* Method 설명 : 타일로드 이벤트 등록하기 테스트
	*/
	@RequestMapping("addTilesloadedEvent")
	public String addTilesloadedEventViewTest() {
		return "test/map/addTilesloadedEvent";
	}
	
	
	/**
	* Method : addClustererClickEventViewTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 4.
	* 변경이력 :
	* @return
	* Method 설명 : 클러스터 뷰 테스트 뷰
	*/
	@RequestMapping("addClustererClickEvent")
	public String addClustererClickEventViewTest() {
		
		
		return "test/map/addClustererClickEvent";
	}
	
	/**
	* Method : coord2addrViewTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 4.
	* 변경이력 :
	* @return
	* Method 설명 : 좌표로 주소 얻어내기 
	*/
	@RequestMapping("coord2addr")
	public String coord2addrViewTest() {
		return "test/map/coord2addr";
	}
	
	/**
	* Method : calculatePolylineDistanceViewTest
	* 작성자 : Jae Hyeon Choi
	* 생성날짜 : 2018. 12. 4.
	* 변경이력 :
	* @return
	* Method 설명 : 화살표 테스트
	*/
	@RequestMapping("calculatePolylineDistance")
	public String calculatePolylineDistanceViewTest() {
		return "test/map/calculatePolylineDistance";
	}
}
