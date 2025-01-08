<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>

    /* 기본 모달 스타일 */
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1100;
	}
	
	/* 모달 내부 콘텐츠 */
	.modal-content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    width: 400px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	/* 모달 헤더 */
	.modal-header {
	    display: flex;
	    justify-content: end;
	    align-items: center;
	    border-bottom: 1px none #ddd;
	    margin-bottom: 15px;
	}

	/* 닫기(x) 버튼 */
	.modal-close {
	    font-size: 20px;
	    cursor: pointer;
	}
	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.form-label {
	    display: block;
	    font-size: 14px;
	    margin-bottom: 5px;
	}
	
	.form-input {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 모달 푸터 */
	.modal-footer {
	    display: flex;
	    justify-content: center;
	    gap: 10px;
	}
	
	.write-btn{
		border-bottom: 1px solid #E4E6E8;
	}
	
	.list-form{
		border: 1px solid #E4E6E8;
		border-radius: 6px;
		padding: 17px;
		width: 40%;
    	margin-top: 20px;
    	display: flex;
    	justify-content: space-between;
    	height: 200px;
	}
	
	.list-row{
		padding: 0 16%;
		display: flex;
		justify-content: space-between;
    	flex-wrap: wrap;
	}
	
	.update{
		display: flex;
    	flex-direction: column;
    	justify-content: space-between;
    	align-items: flex-end;
	}
	
	.write-form{
		display: flex;
	    align-items: flex-start;
	    justify-content: space-between;
	    margin: 20px;
	}
	
	.write-form1{
		display: flex;
    	align-items: center;
    	margin: 20px;
	}
	
	.write-form2{
		margin-left: 43px;
	}
	
	.art{
    	height: 270px;
    	resize: none;
	}
	
	.write-form-3{
		display: flex;
    	margin: 20px;
	}
	
	.btn-room{
		display: flex;
    	justify-content: center;
	}
	
	th{
		width: 20%;
	}
	
	.coutn-dis{
		display: flex;
		align-items: center;
	}

</style>
</head>
<body>
	<!-- 부트스트랩 -->
	<script src="assets/static/js/initTheme.js"></script>
	
	<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
         <section id="menu">
            <h4 class="menu-title">나의 정보</h4>
            <ul>
            	<li id="firstMenu"><a href="#">나의 정보</a></li>
				<li id="secondMenu1" class="active" ><a href="#">출장</a></li>
				<li id="secondMenu2"><a href="#">서명 관리</a></li>
				<li id="secondMenu3"><a href="#">구매기록</a></li>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>출장 수정</h5>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                  <div class="col-12 col-lg-12">
	                  <table class="align-l">
	                  	<tr>
	                  		<th>등록자</th>
	                  		<td class="align-l">
								${tripDTO.name}
								<input type="hidden" name="username" value="${tripDTO.username}">
							</td>
	                  	</tr>
						  <tr>
							  <th>출장명</th>
							  <td><input class="form-control sor-1" type="text" name="subject" value="${tripDTO.subject}"/></td>
						  </tr>
	                  	<tr>
	                  		<th>시작 일시</th>
	                  		<td class="coutn-dis">
	                  			<input class="form-control sor-1" type="datetime-local" name="start_date" style="width: 23%;"/>	                  			
	                  		</td>
	                  	</tr>
	                  	<tr>
	                  		<th>종료 일시</th>
	                  		<td class="coutn-dis">
	                  			<input class="form-control sor-1" type="datetime-local" name="end_date" style="width: 23%;"/>
	                  		</td>
	                  	</tr>
						  <tr>
							  <th>출장 장소</th>
							  <td>
								  <div class="inline-layout">
									  <input type="text" name="address" class="form-control" id="roadAddress" disabled="disabled" data-required="true" value="${tripDTO.address}"/>
									  <button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
								  </div>
							  </td>
						  </tr>
	                  	<tr>
	                  		<th>내용</th>
	                  		<td><textarea class="form-control art" name="content">${tripDTO.content}</textarea></td>
	                  	</tr>
	                  </table>
                  </div>
               	</div>
               	<div class="col-12 col-lg-12">
               		<div class="btn-room">
	           			<div class="btn btn-primary">수정하기</div>
	                	<div class="btn btn-primary">돌아가기</div>
	           		</div>
           		</div>
           	</div>
         </section>   
         
      </div>
    </div>
	</div>
	
	
	
</body>

<!-- 부트스트랩 -->
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>

<script>
	let start_date = '${tripDTO.start_date}';
	let startDate = start_date.slice(0, -3);
	$('#startDate').val(startDate);

	let end_date = '${tripDTO.end_date}';
	let endDate = end_date.slice(0, -3);
	$('#endDate').val(endDate);
</script>
</html>