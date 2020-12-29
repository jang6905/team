<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 수정하기 위해 입력한 정보들은 request객체 메모리에 저장되어 있기때문에..
	//   request객체 메모리영역에서 꺼내오기전에.. 한글 이 깨지는 것을 방지 하기 위해
	//   인코딩 방식을 UTF-8로 설정
	// (한글처리)
	request.setCharacterEncoding("UTF-8");

	//2.수정하기 위해 입력한 정보들과  수정을 위해 수정할 직원번호를  request객체 메모리에서 꺼내오기 (얻기)
	String no = request.getParameter("no");
	//수정을 위해 입력한 정보들 얻기
	//얻는이유 : UPDATE문장을 완성하기 위해!
	String s_id = request.getParameter("s_id");
	String s_name = request.getParameter("s_name");
	String s_pw = request.getParameter("s_pw");
	String s_age = request.getParameter("s_age");
	String s_addr = request.getParameter("s_addr");
	String s_extension = request.getParameter("s_extension");
	String s_dept = request.getParameter("s_dept");

	//3.UPDATE 문장 만들기
	//-> <input type="hidden">태그로 전달 받은 수정할 직원 번호에 해당되는 레코드의?
	//   회원정보를 위 수정을 위해 입력한 정보들로 수정하는 SQL문 만들기 
// update 테이블명 set 수정할필드명 = 수정할값 , 수정할필드명 = 수정할값,......
// where no = 1;
	String sql = "                 ";





%>


