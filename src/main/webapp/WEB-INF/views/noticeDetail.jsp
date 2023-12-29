<%@ page language="java"	contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <c:set var="Map" value="${nList[0]}" />
    <c:set var="c_no" value="${Map['N_NO']}" />
    <c:set var="c_title" value="${Map['N_TITLE']}" />
    <c:set var="c_content" value="${Map['N_CONTENT']}" />
    <c:set var="c_writer" value="${Map['N_WRITER']}" /> 	

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세{WEB-INF}</title>
    <%@include file="/common/bootstrap_common.jsp" %>
	<link rel="stylesheet" href="/css/notice.css">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
    function noticeUpdate() {
      console.log('noticeUpdate 호출');
      const title = document.getElementById('n_title').value;
      const content = document.getElementById('n_content').value;
      const writer = "${c_writer}";
      const no = "${c_no}";
      console.log(title);
      console.log(content);
      console.log("${c_writer}");

      location.href="/notice/noticeUpdate?n_title="+title+"&n_content="+content+"&n_writer="+writer+"&n_no="+no;
    }

		function noticeDelete() {
		console.log('noticeDelete 호출');
		const rowData = new Array();
		const tdArr = new Array();
		const checkbox = $("input[name=user_CheckBox]:checked");

		checkbox.each(function(i) {
		const tr = checkbox.parent().parent().eq(i);
		const td = tr.children();
		rowData.push(tr.text());

		const n_no = td.eq(1).text();
		const n_title = td.eq(2).text();
		const n_writer = td.eq(3).text();
				
		// 가져온 값을 배열에 담는다.
		tdArr.push(n_no);
		tdArr.push(n_title);
		tdArr.push(n_writer);
		
		const n_no2 = tdArr[i * 3];
		console.log(n_no2);
		location.href="/notice/noticeDelete?n_no="+n_no2;
			});
	}
    </script>
  </head>
  <body>
    <!-- 공지사항 목록 처리할 코드 작성해 보기 -->
	<!-- header start -->
	<%@include file="/include/gym_header.jsp" %>
	<!-- header end -->
	<div class="container">
		<div class="page-header">
			<h2>공지사항 <small>공지 상세</small></h2>
			<hr />
		</div>

		<!-- 회원목록 시작 -->
		<div class='notice-list'>
			<button id="btn_update" class="btn btn-success" onClick="noticeUpdate()">수정</button>
			<button id="btn_delete" class="btn btn-danger" onClick="noticeDelete()">삭제</button>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">선택</th>
		        		<th width="10%">#</th>
		        		<th width="50%">제목</th>
		        		<th width="20%">작성자</th>
		      		</tr>
		    	</thead>
		    	<tbody>	     
					<tr>
						<td><input type="checkbox" name="user_CheckBox"></td>
						<td>${c_no}</td>
						<td><input type="text" value="${c_title}" id="n_title"></td>
						<td>${c_writer}</td>
					</tr>				
        </tbody>
			</table> 
      <table class="table table-hover">
        <thead>
          <tr style="text-align: center;">
            <th width="100%">내용</th>
          </tr>
        </thead>
        <tbody>
          <td style="text-align: center;">
            <input type="text" value="${c_content}" style="width:100%;height:200px;font-size:15px;" id="n_content">
          </td>
        </tbody>
      </table>
		</div>		
		<!-- 회원목록   끝  -->		
	</div>
	<!-- body end       -->
	<!-- footer start -->
	<%@include file="/include/gym_footer.jsp" %>
	<!-- footer end    -->	

  </body>
	</html>
