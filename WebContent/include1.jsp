<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//인코딩 방식 지정
	request.setCharacterEncoding("UTF-8");

	

%>
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	안녕하세요 쇼핑몰 중심 JSP 시작입니다!!
	<br>
	

	<%-- duke_image.jsp를 동적으로 포워딩 합니다. --%>
	<%-- param액션태그를 이용해 duke_image.jsp로 이름과 파일이름을 전달합니다. --%>
	<jsp:include page="duke_image.jsp">
		<jsp:param value="듀크" name="name"/>
		<jsp:param value="duke.png" name="imgName"/>
	</jsp:include>	

	<br>
	안녕하세요 쇼핑몰 중심 JSP 끝부분입니다!!!


</body>
</html>



