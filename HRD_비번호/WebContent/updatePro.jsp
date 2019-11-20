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
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ShopDAO mem_dao = ShopDAO.getInstance();
		MemberVO vo = new MemberVO();
		vo.setCustno(Integer.parseInt(request.getParameter("custno")));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setAddress(request.getParameter("address"));
		vo.setJoindate(request.getParameter("joindate"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		int rs = mem_dao.updateMem(vo);
	%>
	<script type="text/javascript">
	<%if (rs == 1) {%>
		alert("회원정보수정이 완료되었습니다")
		location.href = "memberList.jsp";
	<%} else {%>
		alert("회원정보수정에 실패하였습니다.")
		history.back();
	<%}%>
	</script>
</body>
</html>