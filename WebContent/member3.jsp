
<%@page import="java.util.List"%>
<%@page import="sec01.ex01.MemberDAO"%>
<%@page import="sec01.ex01.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//request객체 영역에 인코딩 방식 UTF-8로 설정
		request.setCharacterEncoding("UTF-8");
		
		//memberForm.html에서 입력한 가입할 회원 데이터들을 request내장객체 영역에서 꺼내오기
		
/*		String id= request.getParameter("id");
		String pwd= request.getParameter("pwd");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
*/
%>
		
	<%--
		useBean액션태그를 이용해 id속성값이 m인 MemberBean클래스를 이용해 객체를 생성합니다.
		생성된 MemberBean객체를 참조할 범위 scope속성의 값을 page로 지정하면
		현재 member2.jsp페이지 내에서만 MemberBean객체를 공유해서 사용할수 있다.
		참고 : scope="page" <-- 생략하면 기본값은 scope="page"로 설정되어 있다.
	 --%>	
		<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page"/>
	
		
	<%-- memberForm.html(회원가입창)에서 전송된 요청값들을 request영역에서 얻어서 
		 memberBean객체의 setter메소드들을 호출시 매개변수로 전달하여 각 변수에 저장
	 --%>
	 		<%-- value속성적을때 단일따옴표로 묶어야됨 '  '  --%>
		<%--setId(String id)메소드 호출시 매개변수로 value속성값의 값을 전달하여 id인스턴스변수에 저장 --%>
		<jsp:setProperty property="id"    name="m" value='<%=request.getParameter("id") %>'/>
		<%--setName(String name)메소드 호출시 매개변수로 value속성값의 값을 전달하여 name객체변수에 저장 --%>
		<jsp:setProperty property="name"  name="m" value='<%=request.getParameter("name") %>'/>
		<jsp:setProperty property="pwd"   name="m" value='<%=request.getParameter("pwd") %>'/>
		<jsp:setProperty property="email" name="m" value='<%=request.getParameter("email") %>'/>
		
	
	<%
		/* 위의 setProperty 액션태그 사용을 위한 주석처리
		
		//입력한 회원정보들을 MemberBean객체의 각 객체변수에 저장 하기 위해 ...
		//set으로 시작되는 메소드들을 호출하자.
		m.setId(id);
		m.setPwd(pwd);
		m.setName(name);
		m.setEmail(email);
		*/
		
//		입력한 회원데이터들을 MemberBean객체 생성시 생성자를 호출해 각 인스턴스변수에 저장
//		MemberBean m = new MemberBean(id, pwd, name, email);
		
		//입력한 회원데이터들을 DB에 전송하여 INSERT작업하기 위해 MemberDAO객체 생성시
		//기본생성자를 호출해 커넥션풀 얻기
		MemberDAO memberDAO = new MemberDAO();
		
		
		//입력한 회원데이터들을 DB의 t_member테이블에 INSERT하기 위해 addMember메소드 호출시
		//MemberBean객체를 매게변수로 전달 하여 작업 합니다.
		memberDAO.addMember(m);
		
		
		//DB의 테이블에 저장되어 있는 전체 회원정보를 조회하기 위해 MemberDAO의 listMembers()메소드 호출
		//반환값으로 조회한 회원정보들을 받자
	 
		List membersList = memberDAO.listMembers();
		out.print(membersList.size());
		
	%>

	<table align="center" width="100%">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="5%">이름</td>
			<td width="11%">이메일</td>
			<td width="5%">가입일</td>
		</tr>
	
	<%
	//DB에 조회한 회원정보가 없으면 
	if(membersList.size() == 0 ){
	%>	
		<tr>
			<td colspan="5">
				<b>등록된 회원이 없습니다.</b>
			</td>
		</tr>
		
	<%
	}else{//DB에조회한 회원이 있으면?
			
			//for반복문을 이용해 ArrayList배열에 저장된 MemberBean객체를 하나씩 가져온후
			//MemberBean객체의 각변수에 저장된 조회한 회원정보들을 getter메소드를 호출해서 얻은후 출력
			for(int i=0; i<membersList.size(); i++){
				
			MemberBean bean =(MemberBean)membersList.get(i);
	%>			
			<tr align="center">
				<td><%=bean.getId() %></td>
				<td><%=bean.getPwd() %></td>
				<td><%=bean.getName() %></td>
				<td><%=bean.getEmail() %></td>
				<td><%=bean.getJoinDate()%></td>
			
			
			</tr>
		
		<%	}//for끝
		
	}//else끝
	%>
	
		<tr height="1" bgcolor = "#99ccff">
		
	</tr>
	
	
	</table>












</body>
</html>