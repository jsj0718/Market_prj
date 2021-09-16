<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://www.expertphp.in/js/jquery.form.js"></script>
<script>
function preview_images() 
{
 /* var total_file=document.getElementById("images").files.length; */
 var total_file=document.getElementById("images").files.length;
 for(var i=0;i<total_file;i++)
 {
  $('#image_preview').append("<div class='col-md-2'><img class='img-responsive' src='"+URL.createObjectURL(event.target.files[i])+"'></div>");
 }
}
</script>
<style>

	/*-------img upload css-------*/
	.input-file-button{
	  padding: 20px 25px;
	  background-color:white;
	  border-radius: 4px;
	  border: 1px solid grey;
	  color: grey;
	  cursor: pointer;
	}
	
	.input-file-button img {
		display: block;
		width: 15px;
		height: 15px;
		display: block; margin: 0px auto;
	}
	.img-responsive:hover {
		filter: brightness(75%);
	}
	
</style>

</head>
<body>
<!-- post -->
	<div class="container">
		<div class="mt-5">
			<!-- 이미지 업로드 -->
		  	<div class="row">
				<form action="#" method="post" enctype="multipart/form-data" class="col-md-2">
					<div class="">
						<label class="input-file-button" for="images">
							<img class="fit-picture" src="${pageContext.request.contextPath}/resources/img/camera.png" alt="camera">
							사진
						</label>
						<input type="file" class="form-control" id="images" name="images[]" onchange="preview_images();" multiple style="display:none;"/>
					</div>
					
					<div class="mt-5">
					    <input type="submit" class="btn btn-primary" name='submit_image' value="완료"/>
					</div>
					
				</form>
				<!-- 이미지 업로드 미리보기 -->
				<div class="">
					<div class="row" id="image_preview"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	
</script>
</html>