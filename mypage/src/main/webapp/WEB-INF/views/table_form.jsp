<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>table_form</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="table/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="table/css/table_util.css">
<link rel="stylesheet" type="text/css" href="table/css/table_main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
				<!-- table_main.css -> .table100.ver1 th ->  배경 색상 조절 -->
				<!-- 				   .table100.ver1 .table100-body tr:nth-child(even) -> 짝수간격으로 배경색 조절-->
					<div class="table100-head">
						<table>
						
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">table_main.css</th>
									<th class="cell100 column2">-></th>
									<th class="cell100 column3">.table100.ver1 th</th>
									<th class="cell100 column4">-></th>
									<th class="cell100 column5">배경색 조절</th>
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="table100-body js-pscroll">
						<table>
						<!-- .table100.ver1 .table100-body tr:nth-child(even) -->
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1">Like a butterfly</td>
									<td class="cell100 column2">Boxing</td>
									<td class="cell100 column3">9:00 AM - 11:00 AM</td>
									<td class="cell100 column4">Aaron Chapman</td>
									<td class="cell100 column5">10</td>
								</tr>
	
								<tr class="row100 body">
									<td class="cell100 column1">.table100.ver1</td>
									<td class="cell100 column2">.table100-body </td>
									<td class="cell100 column3">tr:nth-child(even)</td>
									<td class="cell100 column4">에서 배경색조절</td>
									<td class="cell100 column5">15</td>
								</tr>

								
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>


	<!--===============================================================================================-->
	<script src="table/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/bootstrap/js/popper.js"></script>
	<script src="table/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="table/js/main.js"></script>
	

</body>
</html>