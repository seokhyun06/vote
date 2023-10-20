<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
	<%
		String sql = "select v_name, '19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) || '일생' as birth," + 
					" trunc(months_between(sysdate, to_date(substr('19' || v_jumin, 1, 8), 'yyyymmdd')) /12) as age," +
					" case substr(v_jumin, 7, 1) when '1' then '남' else '여' end as v_gender," +
					" m_no, substr(v_time, 1,2)||':'||substr(v_time, 3,2) as v_time," +
					" case v_confirm when 'Y' then '확인' else '미확인' end as v_confirm" +
					" from tbl_vote_202005 where v_area = '제1투표장'";
		
		Connection conn = DBConnect.getconnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
					
	%>
	
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
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
<h2>투표검수조회</h2>
	<table class="table_style" style="width: 750px;">
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>	
		
		<% while(rs.next()) { %> 
		<tr style="text-align: center">
			<td><%=rs.getString("v_name") %></td>		
			<td><%=rs.getString("birth") %></td>		
			<td><%="만 " + rs.getString("age") + "세"%></td>
			<td><%=rs.getString("v_gender") %></td>		
			<td><%=rs.getString("m_no") %></td>
			<td><%=rs.getString("v_time") %></td>
			<td><%=rs.getString("v_confirm") %></td>		
		</tr>
			<% }%>
	</table>
</section>

<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>