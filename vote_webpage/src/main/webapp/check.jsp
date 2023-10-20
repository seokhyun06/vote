<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
	<%
		String sql = "select m.m_no, m.m_name, p.p_name," +
					" case m.p_school when '1' then '고졸' when '2' then '학사' when '3' then '석사' else '박사' end as p_school," + 
					" substr(m_jumin, 1, 6) || '-' || substr(m_jumin, 7, 13) as j_jumin, m.m_city, p_tel1 || '-' || p_tel2 || '-' || p_tel3 as p_phone" +
					" from TBL_MEMBER_202005 m, TBL_PARTY_202005 p where m.p_code = p.p_code";
		
		Connection conn = DBConnect.getconnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
	%>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
</header>

<nav>
	<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>

<section class = "section">
	<h2>후보조회</h2>
		<table class = "table_style" style="width: 750px">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			
			</tr>
			
			<% while(rs.next()) { %>
			<tr style="text-align: center">
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("p_name") %></td>
				<td><%=rs.getString("p_school") %></td>
				<td><%=rs.getString("j_jumin") %></td>
				<td><%=rs.getString("m_city") %></td>
				<td><%=rs.getString("p_phone") %></td>			
			
			</tr> <% } %>
		</table>
</section>

<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>