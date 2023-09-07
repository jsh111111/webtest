<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO" />
<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
NoticeDTO dto = dao.read(noticeno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container m-3">
		<h3>공지사항 수정</h3>
		<form action="updateProc.jsp" method="post">
			<input type="hidden" name="noticeno" value="<%=noticeno%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			
			<div class="mb-3 mt-3">
				<label for="wname">작성자:</label> <input type="text"
					class="form-control" id="wname" value="<%=dto.getWname()%>"
					name="wname">
			</div>
			<div class="mb-3 mt-3">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" value="<%=dto.getTitle()%>"
					name="title">
			</div>
			<div class="mb-3 mt-3">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content"><%=dto.getContent()%></textarea>
			</div>
			<div class="mb-3 mt-3">
				<label for="pw">비밀번호:</label> <input type="password"
					class="form-control" id="passwd" placeholder="Enter passwd"
					name="passwd">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-light">Cancel</button>

		</form>
	</div>
</html>