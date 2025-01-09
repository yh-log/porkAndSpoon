<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출장 수정</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>

	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}

	.art{
    	height: 270px;
    	resize: none;
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

	td div.inline-layout{
		display: flex;
		align-items: center;
		flex-wrap: nowrap;
		white-space: nowrap;
		gap: 10px;
	}

	.required-value{
		color: var(--bs-danger);
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
					  <form>
						  <table class="align-l">
							<tr>
								<th>등록자</th>
								<td class="align-l">
									${tripDTO.name}
									<input type="hidden" name="username" value="${tripDTO.username}"/>
									<input type="hidden" name="idx" value="${tripDTO.idx}"/>
									<input type="hidden" name="schedule_idx" value="${tripDTO.schedule_idx}"/>
								</td>
							</tr>
							  <tr>
								  <th>출장명<span class="required-value">*</span></th>
								  <td><input class="form-control sor-1" type="text" name="subject" value="${tripDTO.subject}" data-required="true"/></td>
							  </tr>
							<tr>
								<th>시작 일시<span class="required-value">*</span></th>
								<td class="coutn-dis">
									<input class="form-control sor-1" id="startDate" type="datetime-local" name="start_date" style="width: 23%;" data-required="true"/>
								</td>
							</tr>
							<tr>
								<th>종료 일시<span class="required-value">*</span></th>
								<td class="coutn-dis">
									<input class="form-control sor-1" id="endDate" type="datetime-local" name="end_date" style="width: 23%;" data-required="true"/>
								</td>
							</tr>
							  <tr>
								  <th>출장 장소<span class="required-value">*</span></th>
								  <td>
									  <div class="inline-layout">
										  <input type="text" name="address" class="form-control" id="roadAddress" disabled="disabled" data-required="true" value="${tripDTO.address}"/>
										  <button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
									  </div>
								  </td>
							  </tr>
							<tr>
								<th>내용<span class="required-value">*</span></th>
								<td><textarea class="form-control art" name="content">${tripDTO.content}</textarea></td>
							</tr>
						  </table>
					  </form>
                  </div>
               	</div>
               	<div class="col-12 col-lg-12">
               		<div class="btn-room">
	           			<div class="btn btn-primary" onclick="layerPopup('출장을 수정하시겠습니까?', '확인', '취소', tripUpdate, removeAlert)">수정</div>
	                	<div class="btn btn-outline-primary" onclick="location.href='/trip/detail/${tripDTO.schedule_idx}'">취소</div>
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
	let start_date = '${tripDTO.start_date}'; // 예: '2025-01-22 19:41:00'
	//let startDate = start_date.slice(0, -3).split(" "); // 초 부분 제거 -> '2025-01-22 19:41'
	$('#startDate').val(start_date); // input에 값 설정
	//let startDateVal = startDate.split(" "); // 공백으로 분리 -> ['2025-01-22', '19:41']
	//let value = ; // '2025-01-22T19:41'

	let end_date = '${tripDTO.end_date}';
	//let endDate = end_date.slice(0, -3);
	$('#endDate').val(end_date);

	function validateForm(){
		let requiredFields = document.querySelectorAll('[data-required="true"]');
		let isVaild = true;

		requiredFields.forEach(function (field){
			if(!field.value.trim()){
				field.classList.add('is-invalid'); // 클래스 추가
				isValid = false;
			}else {
				field.classList.remove('is-invalid'); // 유효하면 클래스 제거
			}
		});

		return isVaild;

	}

	function tripUpdate(){

		let isFormValid = validateForm();

		if (isFormValid) {
			console.log('폼이 유효합니다.');

			let form = document.querySelector('form');
			let formData = new FormData(form);

			formData.append('address', $('input[name="address"]').val());

			fileAjax('PUT', '/trip/update', formData);

		} else {
			removeAlert();
			console.log('폼에 잘못된 값이 있습니다.');
			layerPopup("필수값을 입력해주세요.", "확인", false, removeAlert, removeAlert); // 실패 시 팝업
		}
	}

	function fileSuccess(response){
		removeAlert();
		if(response.status === 200){
			layerPopup(response.message, '확인', false, function(){location.href = '/trip/detail/' + response.schedule_idx;}, removeAlert);
		}else{
			layerPopup(response.message, '확인', false, removeAlert, removeAlert);
		}
	}
</script>
</html>