<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO" />
<%
//검색관련------------------------
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if (col.equals("total")) {
	word = "";
}

//페이지관련-----------------------
int nowPage = 1;//현재 보고있는 페이지
if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage = 5;//한페이지당 보여줄 레코드갯수

int sno = (nowPage - 1) * recordPerPage; //디비에서 가져올 시작위치

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", recordPerPage);

List<NoticeDTO> list = dao.list(map);

int total = dao.total(col, word);

String url = "list.jsp";

String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
%>
<!DOCTYPE html>
<html>
<head>
<title>글 목록</title>
<meta charset="utf-8">
<script type="text/javascript">
	function read(bbsno) {
		let url = "read.jsp";
		url += "?noticeno=" + noticeno;
		url += "&nowPage=<%=nowPage%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		
		location.href = url;

	}
</script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div class="container mt-3">

		<h3>게시판 목록</h3>
		<form action="./list.jsp">
			<div class="row">
				<div class='col'>
					<select class="form-select" name="col">
						<option value="wname"
							<%if (col.equals("wname"))
	out.print("selected");%>>성명</option>
						<option value="title"
							<%if (col.equals("title"))
	out.print("selected");%>>제목</option>
						<option value="content"
							<%if (col.equals("content"))
	out.print("selected");%>>내용</option>
						<option value="title_content"
							<%if (col.equals("title_content"))
	out.print("selected");%>>제목+내용</option>
						<option value="total"
							<%if (col.equals("total"))
	out.print("selected");%>>전체출력</option>
					</select>
				</div>
				<div class="col">
					<input type="text" class="form-control" placeholder="Enter 검색어"
						name="word" value="<%=word%>">
				</div>
				<div class='col'>
					<button type="submit" class="btn btn-dark">검색</button>
					<button type="button" class="btn btn-dark"
						onclick="location.href='./createForm.jsp'">등록</button>
				</div>
			</div>
		</form>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (list.size() == 0) {
				%>
				<tr>
					<td colspan="6">등록된 글이 없습니다.</td>

					<%
					} else {

					for (int i = 0; i < list.size(); i++) {
						NoticeDTO dto = list.get(i);
					%>
				
				<tr>
					<td><%=dto.getNoticeno()%></td>
					<td>
					<a href="javascript:read('<%=dto.getNoticeno()%>')"><%=dto.getTitle()%></a>
					<%
					if(Utility.compareDay(dto.getRdate())){
						out.print("<img src='../images/new.gif'>");
					}
					%>
					</td>
					<td><%=dto.getWname()%></td>
					<td><%=dto.getRdate()%></td>
					<td><%=dto.getCnt()%></td>
				</tr>
				<%
				} //for_end

				} //if_end
				%>
			</tbody>

		</table>

		<%=paging%>

	</div>
</body>
</html>
