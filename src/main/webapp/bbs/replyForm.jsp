<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
BbsDTO dto = dao.readReply(bbsno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
</head>
<body>
<body>
	<jsp:include page="/menu/top.jsp" />
<div class="container mt-3">
        <h3>게시판 답변</h3>
        <form action="replyProc.jsp" method="post">
          <input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
          <input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
          <input type="hidden" name="indent" value="<%=dto.getIndent()%>">
          <input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
          <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		  <input type="hidden" name="word" value="<%=request.getParameter("word")%>">

                <div class="mb-3 mt-3">
                        <label for="wname">이름:</label> <input
					type="text" class="form-control" id="wname"
					placeholder="Enter wname" name="wname">
                </div>
                <div class="mb-3 mt-3">
                        <label for="title">제목:</label> <input
					type="text" class="form-control" id="title"
					value="<%=dto.getTitle()%>" name="title">
                </div>
                <div class="mb-3 mt-3">
                        <label for="content">내용:</label>
                        <textarea class="form-control" rows="5"
					id="content" name="content"></textarea>
                </div>
                <div class="mb-3 mt-3">
                        <label for="pw">비밀번호:</label> <input
					type="password" class="form-control" id="passwd"
					placeholder="Enter passwd" name="passwd">
                </div>
 
                <button type="submit" class="btn btn-primary">Submit</button>
 
        </form>
</div>
</body>
</body>

</html>