<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<jsp:useBean id="dto" class="com.bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());
 
dao.upAnsnum(map);
boolean flag = dao.createReply(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답변처리</title>
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=request.getParameter("nowPage")%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href = url;
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container mt-3">
        <div class="container p-5 my-5 border">
                <%
                if (flag) {
                        out.print("글 답변 성공입니다.");
                } else {
                        out.print("글 답변 실패입니다.");
                }
                %>
        </div>
        <button class="btn btn-light" onclick="location.href='createForm.jsp'">다시
                등록</button>
        <button type="button" class="btn btn-light"
                onclick="list()">목록</button>
</div>
</body>
</html>