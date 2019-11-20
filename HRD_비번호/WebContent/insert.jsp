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
	} else if ( !(frm.grade.value=="A" || frm.grade.value=="B" || frm.grade.value!="C")) {
		alert("회원등급이 옳바르지 않았습니다.(A,B,C)");
		frm.grade.focus();
		return false;
	}
	if(frm.city.value=="" ){
		alert("도시코드가 입력되지 않았습니다.");
		frm.city.focus();
		return false;
	} else if (frm.city.value.length>2){
		alert("도시코드는 2자리까지 입력가능합니다.");
		frm.city.focus();
		return false;
	}
	alert("sss");
	document.frm.method="post";
	document.frm.action="insertPro.jsp";
	document.frm.submit();	
}

</script>
</head>
<body>
<% 
	ShopDAO dao = ShopDAO.getInstance();
	int custno = dao.getCustno();
%>
	<header>쇼핑몰 회원관리 ver 1.0</header>
	<nav>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="insert.jsp">회원등록</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="memberList.jsp">회원목록조회/수정</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="priceList.jsp">회원매출조회</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp">홈으로</a>
	</nav>
	<section>
		<p>홈쇼핑 회원 등록</p>
		<form action="insertPro.jsp" method="post" name="frm">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" id="custno" value="<%=custno %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" id="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" id="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" id="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" id="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIPO,B:일반,C:직원]</td>
					<td><input type="text" name="grade" id="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" id="city"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="등록" name="btnsubmit"
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























