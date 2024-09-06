<%@page import="javax.swing.RepaintManager"%>
<%@page import="com.hk.dtos.HKDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.daos.HKDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hkController.jsp</title>
</head>
<body>
<%
	//1단계: Command 값 받기 - 어떤 요청인지 확인
	//ex) index.jsp → 글 목록 요청 → hkController.jsp
	String command = request.getParameter("command");
	
	//2단계: DAO객체 생성 - DB관련 작업 수행을 위한 준비단계
	HKDao dao = new HKDao();
	
	//3단계: 분기 - Command값 확인 후 요청작업 처리 실행
	if(command.equals("boardlist")){
		//글 목록 요청 처리
		//4단계: 파라미터 받기 ← 여기선 받을 값 X
		
		//5단계:dao메서드 실행
		List<HKDto> lists = dao.getAllList();		//글 목록 반환
		
		//6단계: Scope 객체에 담기
		request.setAttribute("lists", lists);	//RS["lists":lists]
		
		//7단계: 페이지 이동
		pageContext.forward("boardlist.jsp");
	}else if(command.equals("boarddetail")){	//상세보기
		//4단계: 파라미터 받기
		int seq = Integer.parseInt(request.getParameter("seq"));
		HKDto dto = dao.getBoard(seq);		//글 하나에 대한 정보 
		request.setAttribute("dto", dto);
		pageContext.forward("boarddetail.jsp");
	}else if(command.equals("insertboardForm")){	//글 추가 폼 이동
		response.sendRedirect("insertboardForm.jsp");	
	}else if(command.equals("insertboard")){
		//4단계: 파라미터 받기
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		boolean isS = dao.insertBoard(new HKDto(id,title,content));
		if(isS){
			//response.sendRedirect("hkController.jsp?command=boardlist");
			pageContext.forward("hkController.jsp?command=boardlist");
		}else{
			%>
			<script type="text/javascript">
				alert("글 추가 실패");
				location.href = "hkController.jsp?command=insertboardForm";
			</script>
			<% 
		}
	}
	
%>
</body>
</html>