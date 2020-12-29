<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifySawon.jsp 직원정보 수정 페이지</title>
</head>
<body>
<%
	//흐름 : index.jsp에서 수정<a>태그를 클릭했을때
	//수정할 직원 no를 전달 받아.. no에 해당되는 직원 한사람의 정보를 검색해서 
	//현재 페이지에 출력하고,  출력한 정보를 보고 사용자가 직원정보를 수정한후
	//DB에 UPDATE작업을 함.
	
	//1.index.jsp에서  전송받은 수정할 직원번호를 얻기 전에 인코딩 방식 지정
	request.setCharacterEncoding("UTF-8");
	
	//2.수정할 직원 번호를 request영역에서 얻기
	String no = request.getParameter("no");
	
	//2-1. 전달받은 수정할 직원번호에 해당되는 레코드 검색 하는 SELECT문 준비
	String sql = "select * from tblSawon where no=" + no;
	
	//3.DB작업을 위한 java.sql패키지에 존재하는 삼총사 객체를 담을 변수 준비
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//4.연결할 DB주소, DB접속id, DB접속PW정보 변수에 저장
	String url = "jdbc:mysql://localhost:3306/jspbeginner?serverTimezone=Asia/Seoul";
	String id = "jspid", pw = "jsppass";
	
	//5.SELECT작업후  수정할 직원 정보를 저장할 변수들 선언
	String s_id = null, s_name = null, s_pw = null, s_age = null, s_addr = null;
	String s_extension = null, s_dept = null;
	
	//6. DB연동후 SELECT작업
	try{
		//1단계 MySQL DBMS에서 제공해주는 Driver.class의 객체를 동적으로 생성해서
		//DriverMannger클래스에 저장(등록)
		//요약 : 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계 DriverMannger클래스를 이용해 DB와 연결을 맺은  Connection객체 얻기
		//JSP --- 연결 --- DB
		con = DriverManager.getConnection(url, id, pw);
		
		//3단계 Statement실행객체 얻기
		stmt = con.createStatement();
		
		//4단계 select문장을 DB에 전송하여 검색! 
		//검색한 결과 데이터들을  ResultSet객체에 테이블형식으로 담아 리턴
		rs = stmt.executeQuery(sql);
		
		//5단계 ResultSet객체에 저장된 검색한 회원한명의 정보를 꺼내와서 각변수에 저장
		if(rs.next()){
			s_id = rs.getString("id");
			s_name = rs.getString("name");
			s_pw = rs.getString("pass");
			s_age = String.valueOf(rs.getInt("age"));
			s_extension = rs.getString("extension");
			s_dept = rs.getString("dept");
			s_addr = rs.getString("addr");
		}
	}catch(Exception exception){
		
		System.out.println("modifySawon.jsp에서 예외 발생 : " + exception);
		
	}finally{
		//자원해제
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}		
%>

	<%--7. 수정하기 전에 먼저 검색한 직원 한명의 정보를 나타내자(출력해주자) --%>	
	<%--8. 나타낸 정보를 다시 수정하기 위해 입력후  modifySawon_pro.jsp로 수정요청! --%>
<form action="modifySawon_pro.jsp" method="post">

	<%--수정할 직원번호는 <input>태그는 노출 하지 않고  수정할직원번호만  request에 담아 전송 --%>
	<input type="hidden" name="no" value="<%=no%>">
	
	<div align="center">
		<h1>직원 정보 수정</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="s_id"  value="<%=s_id%>"></td>
			</tr>		
			<tr>
				<th>이름</th>
				<td><input type="text" name="s_name" value="<%=s_name%>"> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="s_pw" value="<%=s_pw%>"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="s_age" value="<%=s_age%>"></td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<select name="s_addr">
						<option value="서울" <% if(s_addr.equals("서울")){%> selected <%} %>>서울</option>
						<option value="경기" <% if(s_addr.equals("경기")){%> selected <%} %>>경기</option>
						<option value="인천" <% if(s_addr.equals("인천")){%> selected <%} %>>인천</option>
						<option value="수원" <% if(s_addr.equals("수원")){%> selected <%} %>>수원</option>		
					</select>
				</td>
			</tr>
			<tr>
				<th>내선번호</th>
				<td><input type="text" name="s_extension" value="<%=s_extension%>"></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td>
					<select name="s_dept">
						<option value="영업" <%if(s_dept.equals("영업")){%> selected <%}%>>영업</option>
						<option value="기술" <%if(s_dept.equals("기술")){%> selected <%}%>>기술</option>
						<option value="기획" <%if(s_dept.equals("기획")){%> selected <%}%>>기획</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="수정할정보다시입력">
				</td>
			</tr>
		</table>
	</div>
</form>




</body>
</html>





