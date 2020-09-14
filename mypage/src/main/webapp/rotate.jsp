<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="http://jqueryrotate.googlecode.com/svn/trunk/jQueryRotate.js"></script>
<script type="text/javascript" src="${path}/assets/js/jQueryRotateCompressed.js"></script>
<script type="text/javascript">
   $(function () {
        var angle = 0;
        $('#btnRotCw').on('click', function () {
            angle += 2;
            $("#Image1").rotate(angle);
        });
        $('#btnRotAcw').on('click', function () {
            angle -= 2;
            $("#Image1").rotate(angle);
        });
        $('#Image1').draggable();
    });
</script>
</head>
<body>
<button id="btnRotAcw">Rotate AntiClockWise</button>
<button id="btnRotCw">Rotate ClockWise</button>
<img src="https://www.google.com/images/srpr/logo3w.png" id="Image1">
</body>
</html>