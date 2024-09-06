<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 HOME</title>
</head>
<body>
	<h1>회원관리 HOME</h1>
	<p><a href="userList.jsp">(1)회원 조회(조회 후 수정 가능 / 삭제 가능)</a></p>
	<p><a href="userinsertForm.jsp">(2)신규회원 등록</a></p>	<!-- Form은 정적 페이지 -->
	
	<form action="userUpdateForm.jsp" method="post">
		<label>(3)회원수정 - 회원아이디:</label>
		<input type="text" name="userId"/>
		<input type="submit" value="수정"/>
	</form>
	<!--  <a href="userUpdateForm.jsp?userId=KKK"></a> -->
	
	<form action="UserDelete.jsp" method="post" onsubmit="return deleteUser()">
		<label>(4)회원삭제 - 회원아이디:</label>
		<input type="text" name="userId"/>
		<input type="submit" value="삭제"/>
	</form>
	
	<script type="text/javascript">
		function deleteUser() {
			//submit전송 여부
			if(confirm("정말 삭제하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
	
</body>
</html>