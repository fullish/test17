<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login page</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        function checkVal(sel){
            if($.trim($(sel).val()) == ""){
                return true;
            } else {
                return false;
            }
        }
        document.addEventListener('DOMContentLoaded', () =>{
            let id = document.getElementById("m_id");
            let pw = document.getElementById("m_pw");
            console.log(id);
            document.getElementById('loginBtn').addEventListener("click",() =>{
                if(checkVal(id)){
                    alert("아이디를 입력해 주세요.")
                    id.focus();
                }else if(checkVal(pw)){
                    alert("비밀번호를 입력해 주세요.")
                    pw.focus();
                }else{
                    document.getElementById('loginForm').submit();
                }
            });
        });

    </script>
</head>
<body>
<form action="logins" id="loginForm" method="post">
    아이디<input type="text" id="m_id" name="m_id" value="test"/><br/>
    비밀번호<input type="password" id="m_pw" name="m_pw" value="1234"/><br/>
</form>
<input type="button" value="로그인" id="loginBtn" />
</body>
</html>
