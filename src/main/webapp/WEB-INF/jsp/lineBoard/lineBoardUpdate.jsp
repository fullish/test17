<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>update</title>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', ()=>{
            document.getElementById("goForm").submit();
        });
    </script>
</head>
<body>
<form action="lineBoard" id="goForm" method="post">
    <input type="hidden" name="page" value="${param.page}" />
</form>
</body>
</html>
