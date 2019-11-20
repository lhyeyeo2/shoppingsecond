<%@page import="dbpkg.MemberVO"%>
<%@page import="dbpkg.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리</title>
<link rel="stylesheet" href="style.css?a=a" type="text/css">
<script>
function check() {
	if(frm.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	}
	if(frm.phone.value==""){
		alert("회원전화가 입력되지 않았습니다.");
		frm.phone.focus();
		return false;
	}
	if(frm.address.value==""){
		alert("회원주소가 입력되지 않았습니다.");
		frm.address.focus();
		return false;
	}
	if(frm.joindate.value==""){
		alert("회원주소가 입력되지 않았습니다.");
		frm.joindate.focus();
		return false;
	}
	if(frm.grade.value==""){
		alert("회원등급이 입력되지 않았습니다.");
		frm.grade.focus();
		return false;
	} else if ( !(frm.grade.value=="A" || frm.grade.value=="B" || frm.grade.value=="C")) {
		alert("회원등급이 옳바르지 않았습니다.(A,B,C)");
		frm.grade.focus();
		return false;
	}
	if(frm.city.value==""){
		alert("도시코드가 입력되지 않았습니다.");
		frm.city.focus();
		return false;
	} else if (frm.city.value.length>2){
		alert("도시코드는 2자리까지 입력가능합니다.");
		frm.city.focus();
		return false;
	}
	document.frm.method="post";
	document.frm.action="updatePro.jsp";
	document.frm.submit();	
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String custno=request.getParameter("custno");
ShopDAO mem_dao = ShopDAO.getInstance();
MemberVO vo = mem_dao.getMem(Integer.parseInt(custno));
%>
	<header>쇼핑몰 회원관리 ver 1.0</header>
	<nav>
		<ul>
			<li><a href="insert.jsp">회원등록</a></li>
			<li><a href="memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="priceList.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<p>홈쇼핑 회원 정보 수정</p>
		<form name="frm">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" id="custno" 
					value ="<%= vo.getCustno() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" id="custname" 
					value ="<%= vo.getCustname() %>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" id="phone" 
					value ="<%= vo.getPhone()%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" id="address" 
					value ="<%= vo.getAddress()%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" id="joindate" 
					value ="<%= vo.getJoindate()%>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIPO,B:일반,C:직원]</td>
					<td><input type="text" name="grade" id="grade" 
					value ="<%= vo.getGrade()%>"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" id="city" 
					value ="<%= vo.getCity()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="수정" name="btnsubmit"
					onclick="check()">
					<input type="button" value="조회" name="btnlist"
					onclick="location.href='memberList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>HRDKOREA Copyright&copy;2015 All right reserved. Human
		Resource Development Service of Korea</footer>
</body>
</html>

























