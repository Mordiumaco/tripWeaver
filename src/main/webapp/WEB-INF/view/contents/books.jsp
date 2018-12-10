<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %>


<script language="javascript" src="js/jkl-parseXML.js" charset="utf-8"></script>
<script language="javascript">
<!--

 var bar ;
 var cnt = 0;
 var data5 = "";
 var total = 0;
 function rssGet(getPage){
  cnt = 0;
  data5 = "";
  param = document.search.value.value;
  if(getPage == null || getPage == ""){
   getPage = 1;
  }
  start = (getPage - 1 )* 10 + 1;
  //document.write('<div id="out5" style="font=size:0.8em;margin:12px;"></div>');
  //document.write('<div id="out6" style="font-size:0.8em;margin:12px;"></div>');
  param = encodeURIComponent(param);
  url = "http://openapi.naver.com/search?key=x6I0cwX3C7F7Z503W2Yl&query="+param+"&display=10&start="+start+"&target=book&sort=sim";
  rssPreLoader5(url, getPage);
 }
 function rssPreLoader5(url, cpage){
  document.getElementById('out5').innerHTML = 'Pre loading...';
  bar = setInterval('progressbar()',100);

  var xml = new JKL.ParseXML(url);
  var func = function (data5){
   onloaded5(data5,cpage);
  }
  xml.async(func);
  xml.parse();
  
 }
 function onloaded5(xml, cpage){
  data5 = "";
  total = xml.rss.channel.total;
  data5 += "총 검색수 : " +xml.rss.channel.total + "<p>"; 
  for(i = 0; i < xml.rss.channel.item.length ; i++){
   data5 += '<a href="'+xml.rss.channel.item[i].link+'" target=_blank>';
   
   data5 += xml.rss.channel.item[i].title;
   data5 += '</a>';
   data5 += '<br>';
   data5 += '<img src="'+xml.rss.channel.item[i].image+'">';
   data5 += xml.rss.channel.item[i].description;
   data5 += '<br>';
   data5 += '가격 : ' + xml.rss.channel.item[i].price + '원';

   var time = xml.rss.channel.item[i].pubdate;
   //time = time.split("T").join(" ").split("+")[0];
   data5 += '('+time+')<br><br>';
  }
  clearInterval(bar);
  document.getElementById('out5').innerHTMl = 'ok now loaded.';
  rssOut5();
  paging(cpage);
  return data5;

 }
 function rssOut5() {
  document.getElementById('out5').innerHTML = data5;
 }
 function progressbar(){
  document.getElementById('out5').innerHTML += '|';
  document.getElementById('out6').innerHTML = cnt;
  if(cnt > 100){
   clearInterval(bar);
   document.getElementById('out5').innerHTML += 'load 실패'
  }
  cnt++;
 }

 //ajax 용 페이징 author Myung won
 function paging(cpage) {
  alert(cpage)
  pagePerBlock = 10;
  totalPage = parseInt( total / 10 );
  totalBlock = parseInt( totalPage / pagePerBlock );
  cBlock = parseInt( (cpage - 1) / pagePerBlock );
  firstListPage = cBlock * 10 + 1;
  lastListPage = cBlock* 10 + 10;
  if( lastListPage > totalPage)
   lastListPage = totalPage + 1;
    
  msg = "";
  
  if(cBlock > 0){
   msg += "<a href='javascript:rssGet("+(firstListPage - 1)+");'> <- </a>";
  } 
  for(i = firstListPage ; i <= lastListPage; i++){ 
   msg += "<a href='javascript:rssGet("+i+");'>"+ i +"</a>&nbsp;&nbsp;";
  }
  if(cBlock < totalBlock){
   msg += "<a href='javascript:rssGet("+(lastListPage + 1)+");'> -> </a>";
  }
  document.getElementById('paging').innerHTML = msg;
 }

</script>


<div class="sub_container">

	<div id="input" style="clear:both;">
	<form name="search"><input type="text" name="value" ><a href="javascript:rssGet();">검색</a></form>
	</div>
	<div id="output" style="float:left;"></div>
	
	<div id="out5" style="clear:both;font=size:0.8em;margin:12px;"></div>
	<div id="out6" style="clear:both;font=size:0.8em;margin:12px;"></div>
	<div id="paging" style="clear:both;font=size:0.6em;margin:10px;" align="center"></div>

</div>


<%@include file="../tail.jsp" %>