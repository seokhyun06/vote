<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.v_jumin.value){
			alert("주민번호가 입력되지 않았습니다!");
			data.v_jumin.focus();
			return false;
			
		} else if(!document.data.v_name.value){
			alert("성명이 입력되지 않았습니다!");
			data.v_name.focus();
			return false;
			
		}else if(!document.data.m_no.value){
			alert("후보번호가 입력되지 않았습니다!");
			data.m_no.focus();
			return false;
			
		} else if(!document.data.v_time.value){
			alert("투표시간이 입력되지 않았습니다!");
			data.v_time.focus();
			return false;
			
		} else if(!document.data.v_area.value){
			alert("투표장소가 입력되지 않았습니다!");
			data.v_area.focus();
			return false;
			
		} else if(!document.data.v_confirm.value){
			alert("유권자확인 선택되지 않았습니다!");
			data.v_confirm.focus();
			return false;
			
		}
			alert("투표하기 정보가 정삭적으로 등록 되었습니다.");
			return true;
			
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>

	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>

	<section class="section">
		<h2>투표하기</h2>
		<form name="data" action="vote_p.jsp" method="post"
			onsubmit="return checkValue()">
			<table class="table_style">
				<tr class="vote_table">
					<th>주민번호</th>
					<td><input type="text" name="v_jumin"> 예 :
						8906153154726</td>
				</tr>

				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"></td>
				</tr>

				<tr>
					<th>투표번호</th>
					<td><select name="m_no">
						<option value = ""></option>
						<option value = "1">[1] 김후보</option>
						<option value = "2">[2] 이후보</option>
						<option value = "3">[3] 박후보</option>
						<option value = "4">[4] 조후보</option>
						<option value = "5">[5] 최후보</option>
					</select></td>
				</tr>

				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time"></td>
				</tr>

				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area"></td>
				</tr>

				<tr>
					<th>유권자확인</th>
					<td><input type="radio" name="v_confirm" value="Y"> 확인
						<input type="radio" name="v_confirm" value="N"> 미확인</td>
				</tr>

				<tr style="text-align: center">
					<td colspan="2"><input type="submit" value="투표하기"> <input
						type="button" value="다시하기" onclick="location.href='vote.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>