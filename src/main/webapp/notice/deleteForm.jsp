<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
<style type="text/css">
#red {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-3">
		<h2>공지사항 삭제</h2>
		<p id='red'>삭제하면 복구할 수 없습니다</p>
		<form action="deleteProc.jsp" method="post">
			<input type="hidden" name="noticeno" value="<%=request.getParameter("bbsno")%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			<div class="row">
				<div class="col">
					<input type="password" class="form-control"
						placeholder="Enter password" name="passwd" required>
				</div>
				<div class="col">
					<button class="btn btn-dark">삭제</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>