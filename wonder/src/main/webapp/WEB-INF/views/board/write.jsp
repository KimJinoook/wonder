<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/board.css'/>" />

<title>wonder - 자유게시판 글쓰기</title>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btList').click(function(){
			location.href="c:url value='/board/list'/>";
		});
	});
</script>
<!-- ============================ Page Title Start================================== -->

<!-- ============================ Page Title End ================================== -->

<!-- ============================ Submit Property Start ================================== -->
<section>

	<div class="container">
		<div class="row">
			<form name="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='/board/write'/>">
				<fieldset>
					<!-- Submit Form -->
					<div class="col-lg-12 col-md-12">

						<div class="submit-page p-0">

							<!-- Basic Information -->
							<div class="frm_submit_block">
								<h2>글쓰기</h2>
								<hr>
								<div class="frm_submit_wrap">
									<div class="form-row">

										<!--div class="form-group col-md-12"-->
										<div class="form-group col-md-7" id="">
											<label for="boardTitle">제목</label> <input type="text"
												class="form-control" name="boardTitle" id="boardTitle">
										</div>
										<div class="form-group col-md-4 box"></div>

										<div class="form-group col-md-4" id="">
											<label for="userId">작성자</label> <input type="text"
												class="form-control" readonly="readonly" name="userId"
												id="userId" value="testuser">
										</div>
										<div class="form-group col-md-7 box"></div>

										<div class="form-group col-md-4" id="">
											<label for="pwd">비밀번호</label> <input type="password"
												name="pwd" maxlength="4" class="form-control" id="pwd"
												name="pwd">
										</div>
										<div class="form-group col-md-7 box"></div>

										<div class="form-group col-md-5">
											<label for="upfile">첨부파일</label> <input type="file"
												id="upfile" name="upfile" class="form-control" />
										</div>
										<div class="form-group col-md-3" id="byte">
											<span>(최대 2MB)</span>
										</div>
									</div>

									<!-- Detailed Information -->
									<div class="frm_submit_block">
										<div class="frm_submit_wrap">
											<div class="form-row">
												<div class="form-group col-md-12" id="content">
													<label for="boardContent">내용</label>
													<textarea class="form-control ht-120" rows="50" cols="50"
														id="boardContent"></textarea>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group" id="submitlist">
										<div class="col-lg-12 col-md-12">
											<button class="btn btn-theme" type="submit">
												<i class="fas fa-edit"></i> 등록</button>
											<button class="btn btn-theme" type="button" id="btlist"
												onclick="location.href='<c:url value='board/list'/>'">
												<span class="ti-view-list"></span> 목록
											</button>
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</section>
<!-- ============================ Submit Property End ================================== -->


<%@ include file="../inc/bottom.jsp"%>