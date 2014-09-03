<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SD and FK Search View</title>
<script src="http://code.jquery.com/jquery-1.2.3.min.js"></script>
<style type="text/css">
.sdv {
	position: absolute;
	top: 10%;
	left: 1%;
	width: 44%;
	height: auto;
	
}
.fkv {
	position: absolute;
	top: 10%;
	right: 4%;
	width: 44%;
	height: auto;
	
}
.search {
	position: absolute;
	top: 2%;
	left: 40%;
	width: 50%;
	height: 5%;
	/* background-color: #976; */

}
.keyw {
	position: absolute;
	top: 1%;
	left: 40%;
}

</style>
<script>
// zoom for SD
$(document).ready(function(){
  $("#zoomi").click(function(){
    $("#sdv").css("transform","scale(0.55)"); 
    $("#sdv").css("width","100%");
    $("#adf").css("width","95%");
    $("#sdv").css("top","5%");
    $("#sdv").css("left","-12%");
    
  });
});

$(document).ready(function(){
  $("#zoomo").click(function(){
    $("#sdv").css("transform","scale(0.7)"); 
    $("#sdv").css("width","90%");
    $("#sdv").css("left","-2%");
    $("#sdv").css("top","5%");
    
  });
});

$(document).ready(function(){
  $("#zoomf").click(function(){
    $("#sdv").css("transform","scale(1)"); 
    $("#sdv").css("width","100%");
    $("#sdv").css("left","1px");
    $("#sdv").css("top","1px");
    $("#adf").css("width","100%");
    $("#adf").css("left","1px");
  });
});

// original
$(document).ready(function(){
  $("#zoomorigin").click(function(){
    location.reload(true);
    
  });
});


// zoom for others
$(document).ready(function(){
  $("#ozoomi").click(function(){
    $("#fkv").css("transform","scale(0.55)"); 
    $("#fkv").css("width","90%");
    $("#oadf").css("width","100%");
    $("#fkv").css("right","-30%");
    $("#fkv").css("top","-5.6%");
    //$("#oadf").css("left","1px");
    
  });
});

$(document).ready(function(){
  $("#ozoomo").click(function(){
    $("#fkv").css("transform","scale(0.7)"); 
    $("#fkv").css("width","80%");  
    $("#oadf").css("width","90%");
    $("#fkv").css("right","-28%");
    $("#fkv").css("top","-2%");
    
  });
});

$(document).ready(function(){
  $("#ozoomf").click(function(){
    $("#fkv").css("transform","scale(1)"); 
    $("#fkv").css("width","100%");
    //$("#fkv").css("right","1px");
    $("#fkv").css("top","1px");
    $("#oadf").css("width","100%");
    $("#oadf").css("right","1px");
    $("#oadf").css("top","24px");
    
  });
});

</script>

</head>
<body class="body">

	<button id="zoomi" style="position: absolute; left:1%; top:1px;" name="zoomiti">Zoom-In</button>
	<button id="zoomo" style="position: absolute; left:7%; top:1px;" name="zoomito">Zoom-Out</button>
	<button id="zoomf" style="position: absolute; left:14%; top:1px;" name="zoomitf">Zoom-F</button>
	
	<button id="zoomorigin" style="position: absolute; left:28%; top:1px;" name="zoomitorigin">Zoom Original</button>
	
	<button id="ozoomi" style="position: absolute; right:1%; top:1px;" name="ozoomiti">Zoom-In</button>
	<button id="ozoomo" style="position: absolute; right:7%; top:1px;" name="ozoomito">Zoom-Out</button>
	<button id="ozoomf" style="position: absolute; right:14%; top:1px;" name="ozoomitf">Zoom-F</button>

	
<div class="search">
 <form method="post" action="ads.jsp">
	 <input type="text" name="key" >
	 <select name="compare"><option>ebay.in</option><option>amazon.in</option><option>flipkart.com</option></select>
 <input type="submit" name="searchSub" ></form>
 
</div>

<%
   Cookie cookie = null;
   Cookie[] cookies = null;
   // Get an array of Cookies associated with this domain
   cookies = request.getCookies();
   if( cookies != null ){
      //out.println("<h2> Found Cookies Name and Value</h2>");
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            
      }
      //out.println("<script>alert(\"cookie Del'd\");</script>");
  }else{
      // do nothing..
  }
%>

<div class="fkv" id="fkv" style="position: absolute; height:50%; width:100%; right:-50%;">

 <%
    
 
 	if(request.getParameter("searchSub")!=null)
 	{
 		String key1 = request.getParameter("key");
 		String compare = request.getParameter("compare");
    
    
    
    // snapdeal
	
	
    
    if(compare.equals("ebay.in"))
    {
		out.println("ebay");
		//trksid=p2050601.m570.l1313.TR0.TRC0.H0.XArray& nkw=Array& sacat=0& from=R40
		out.println("<script>");
		  out.println("var url = 'http://www.ebay.in/sch/"+key1+"';");
			out.println("$.getJSON('http://whateverorigin.org/get?url=' + encodeURIComponent(url) + '&callback=?', function(data){");
				out.println("var html = \"\"+data.contents;");
	 //$('#CenterPanel')
				out.println("html = html.replace(new RegExp('(href|src)=\"/', 'g'),  '$1=\"'+url+'/');");
				//out.println("$(\"#fkv\").html(html)[1];");
				out.println("$(\"#fkv\").html(html);");
			out.println("});");
		out.println("</script>");
		
		
		//echo "<b style='position:absolute'>EBAY</b>";
		//echo '<iframe id="iframe" src="http://www.ebay.in/sch/i.html?_trksid=p2050601.m570.l1313.TR0.TRC0.H0.X'.$key.'&_nkw='.$key.'&_sacat=0&_from=R40" sandbox="allow-script" height="1444px" width="614px" ><p>ad</p></iframe>';
		//http://www.ebay.in/sch/i.html?_trksid=p2050601.m570.l1313.TR0.TRC0.H0.Xsamsung+s5&_nkw=samsung+s5&_sacat=0&_from=R40
	}
	else if(compare.equals("amazon.in"))
	{
		
		//echo "amazon";
		out.println("<script>");
		  out.println("var url = 'http://www.amazon.in/s/&field-keywords="+key1+"';");
			out.println("$.getJSON('http://whateverorigin.org/get?url=' + encodeURIComponent(url) + '&callback=?', function(data){");
				out.println("var html = \"\"+data.contents;");
	 
				// Replace relative links to absolute ones 
				out.println("html = html.replace(new RegExp('(href|src)=\"/', 'g'),  '$1=\"'+url+'/');");
				out.println("html = html.split('<body>')");
				out.println("$(\"#fkv\").html(html)[1];");
			out.println("});");
		out.println("</script>");
	
		
		/* echo "<b style='position:absolute'>AMAZON</b>";
		echo '<iframe src="http://www.amazon.in/s/&field-keywords='.$key1.'" sandbox="allow-scripts allow-same-origin" height="1444px" width="614px" >';
		echo "<p>ad</p>";
		echo "</iframe>";
		*/
		//http://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=samsung+s5
		//http://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=moto+g
		
	}
	else if(compare.equals("flipkart.com"))
	{
	  /*
		echo "<script>";
		  echo "var url = 'http://www.flipkart.com/search?q=".$key."&as=off&as-show=off&otracker=start';";
			echo "$.getJSON('http://whateverorigin.org/get?url=' + encodeURIComponent(url) + '&callback=?', function(data){";
				echo "var html = \"\"+data.contents;";
	 
				// Replace relative links to absolute ones 
				echo "html = html.replace(new RegExp('(href|src)=\"/', 'g'),  '$1=\"'+url+'/');";
	 
				echo "$(\"#fkv\").html(html);";
			echo "});";
		echo "</script>";
		
		
		echo "<script>$.getJSON('http://anyorigin.com/dev/get?url=http%3A//www.flipkart.com/search%3Fq%3Dmoto+g%26as%3Doff%26as-show%3Doff%26otracker%3Dstart&callback=?', function(data){
	$('#fkv').html(data.contents); }); </script>";
	*/
	
		
		out.println("<b>"+key1+"</b>");
		out.println("<iframe id=\"oadf\" src=\"http://www.flipkart.com/search?q="+key1+"\" sandbox=\"allow-same-origin allow-scripts allow-popups allow-forms\" style=\"position:absolute; left:-18%;\" height=\"1444px\" width=\"924px\" >");
		out.println("<p>ad</p>");
		out.println("</iframe>");
	
	}
    
    
    
    //echo "<b style='position:absolute'>".$compare."</b>";	
	// <iframe src="mypage.html" style="position:fixed; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;">
	
	
	
	//echo "</script>

 }
	
%>
 
 
</div>





<div class="sdv" id="sdv">

 <%
	
	String key = request.getParameter("key");
	//echo "<b>" . $thing . "</b>";
    //echo '<iframe src="http://www.snapdeal.com/search?keyword='.$key.'&santizedKeyword=&catId=&categoryId=&suggested=false&vertical=&noOfResults=20&clickSrc=go_header&lastKeyword=&prodCatId=&changeBackToAll=false&foundInAll=false&categoryIdSearched=&cityPageUrl=&url=&utmContent=&catalogID=&dealDetail=" sandbox="allow-top-navigation" width="624px" height="1444px;">';
    //echo "<p>ad</p>";
	//echo "</iframe>";
	if(key!=null)
	{
		/*
	echo "<script>";
		  echo "var url = 'http://www.snapdeal.com/search?keyword=".$key."';";
			echo "$.getJSON('http://whateverorigin.org/get?url=' + encodeURIComponent(url) + '&callback=?', function(data){";
				echo "var html = \"\"+data.contents;";
	 
				// Replace relative links to absolute ones 
				echo "html = html.replace(new RegExp('(href|src)=\"/', 'g'),  '$1=\"'+url+'/');";
	 
				echo "$(\"#sdv\").html(html);";
	   	  echo "});";
	echo "</script>";
	*/
	
	out.println("<b>"+key+"</b>");
    out.println("<iframe id=\"adf\" src=\"http://www.snapdeal.com/search?keyword="+key+"&santizedKeyword=&catId=&categoryId=&suggested=false&vertical=&noOfResults=20&clickSrc=go_header&lastKeyword=&prodCatId=&changeBackToAll=false&foundInAll=false&categoryIdSearched=&cityPageUrl=&url=&utmContent=&catalogID=&dealDetail=\" style=\"position:absolute;left:-244px;\" sandbox=\"allow-scripts allow-same-origin\" width=\"904px\" height=\"1444px\" border=\"0px\" >");
    out.println("<p>ad</p>");
	out.println("</iframe>");
	
	/*
	echo "<script>$.getJSON('http://anyorigin.com/dev/get?url=www.snapdeal.com/search%3Fkeyword%3Dmoto+g%26santizedKeyword%3Dmoto+g%26catId%3D%26categoryId%3D%26suggested%3Dfalse%26vertical%3D%26noOfResults%3D20%26clickSrc%3Dgo_header%26lastKeyword%3Dmoto+g&callback=?', function(data){
	$('#output').html(data.contents); }); </script>";
	*/
	
	}
	
	
%>


</div>


</body>
</html>
