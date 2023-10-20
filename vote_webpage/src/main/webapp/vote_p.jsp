<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String sql = "insert into TBL_VOTE_202005 values(?, ?, ?, ?, ?, ?)";
	
		Connection conn = DBConnect.getconnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, request.getParameter("v_jumin"));
		ps.setString(2, request.getParameter("v_name"));
		ps.setString(3, request.getParameter("m_no"));
		ps.setString(4, request.getParameter("v_time"));
		ps.setString(5, request.getParameter("v_area"));
		ps.setString(6, request.getParameter("v_confirm"));
		
		ps.executeUpdate();

	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>