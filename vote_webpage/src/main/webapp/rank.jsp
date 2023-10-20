<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
	<%
		String sql = "select m.m_no, m.m_name, count(v.v_confirm) as v_confirm" +
					" from tbl_vote_202005 v, tbl_member_202005 m" +
					" where v.m_no = m.m_no and v.v_confirm = 'Y'" +
					" group by m.m_no, m.m_name" +
					" order by v_confirm desc";
	
		
		Connection conn = DBConnect.getconnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
					
	%>
<html>
<head>
<meta charset="UTF-8">
<title>후보자등수</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>

<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>

<section class="section">
	<h2>후보자등수</h2>
		<table class="table_style" style="width: 300px">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			
			<% while(rs.next()) { %>
			<tr style="text-align: center">
				<td><%=rs.getString("m_no") %></td>			
				<td><%=rs.getString("m_name") %></td>			
				<td><%=rs.getString("v_confirm") %></td>			
			</tr>
			<% } %>
		</table>
</section>

<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>