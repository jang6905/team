<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 창</title>
</head>
<body>


<%-- 업그레이드, 최초로 login2.jsp(로그인창)요청시 아래의 오류메세지를 출력하지 않기! --%>
	<%
		//request메모리에 인코딩 방식 UTF-8로 설정
		request.setCharacterEncoding("UTF-8");
	
	
		//웹브라우저에서 최초로 접속시에는 request내장객체 메모리 영역에 값이 저장되어 있지 않으므로
		//null이다, 그러므로 아무런 메세지를 표시 하지 않는다
		
		String msg = request.getParameter("msg");
		
		if(msg != null){
	%>			
			<h1><%=msg %></h1>

	<%	}
		
		
	%>

	

	<form action="result2.jsp" method="post">
		아이디 : <input type="text" name="userID" > <br>
		비밀번호 : <input type="password" name="userPW"> <br>
		<input type="submit" value="로그인">
		<input type="reset" value="다시입력">
		
	</form>


</body>
</html>