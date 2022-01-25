<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>한줄게시판</title>
    <style type="text/css">
        body {
            margin: 0px;
            font-size: 0pt;
        }

        .login_wrap {
            text-align: right;
            padding: 10px;
            font-size : 12pt;
        }

        .ob_wrap {
            width: 800px;
            margin: 0px auto;
            border: 1px solid #444444;
        }

        .write_area {
            height: 100px;
        }

        .user_info {
            display: inline-table;
            width: 100px;
            height: 100px;
            vertical-align: top;
        }

        .user_name {
            display: table-cell;
            width: 100px;
            height: 100px;
            vertical-align: middle;
            text-align: center;
            font-size: 12pt;
        }

        .write_con_wrap {
            display: inline-block;
            width: 550px;
            height: 100px;
            vertical-align: top;
        }

        .write_con {
            width: 540px;
            height: 90px;
            resize: none;
            margin: 2px;
        }

        .btn_wrap {
            display: inline-block;
            width: 150px;
            height: 100px;
            vertical-align: top;
        }

        .action_btn {
            width: 146px;
            height: 96px;
            margin: 2px;
        }

        .action_btn2 {
            width: 71px;
            height: 96px;
            margin: 2px;
        }

        .write_area.action_btn2 {
            display: none;
        }

        .login_req_wrap {
            display: inline-table;
            width: 800px;
            height: 100px;
        }

        .login_req {
            display: table-cell;
            width: 800px;
            height: 100px;
            vertical-align: middle;
            text-align: center;
            font-size: 12pt;
        }

        .data_req_wrap {
            display: inline-table;
            width: 800px;
            height: 100px;
            border-top: 1px solid #444444;
            margin-bottom: 5px;
        }

        .data_req {
            display: table-cell;
            width: 800px;
            height: 100px;
            vertical-align: middle;
            text-align: center;
            font-size: 12pt;
        }

        .ob_data {
            border-top: 1px solid #444444;
            margin-bottom: 5px;
        }

        .con_info {
            display: inline-table;
            width: 550px;
            height: 100px;
            vertical-align: top;
        }

        .con {
            display: table-cell;
            width: 100px;
            height: 100px;
            vertical-align: middle;
            text-align: left;
            font-size: 12pt;
        }
        .date {
            display: table-cell;
            width : auto;
            height : 10px;
            vertical-align : bottom;
            text-align: right;
            font-size : 10pt;
        }
        .paging_wrap {
            margin: 5px 0px;
            padding: 5px 0px;
            border-top: 1px solid #444444;
            text-align: center;
        }

        .paging_wrap span {
            margin: 0px 5px;
            font-size: 12pt;
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        function checkVal(sel){
            if($.trim($(sel).val()) == ""){
                return true;
            } else {
                return false;
            }
        }

        $(document).ready(function() {
            //목록에서 수정버튼을 클릭했을때
            $(".ob_list_wrap").on("click","#updateBtn",function(){
                //#update_Btn > .btn_wrap > .ob_data > .con_info > .con
                var con = $(this).parent().parent().children(".con_info").children(".con").html();
                var no = $(this).parent().attr("no");
                $(".write_con").val(con);
                $("#no").val(no);
                $(".write_area .action_btn").hide();
                $(".write_area .action_btn2").show();
            });

            $("body").on("click","#loginBtn",function(){
                location.href = "login";
            });

            $("#logoutBtn").on("click", function(){
                if(confirm("로그 아웃 하시겠습니까?")){
                    location.href = "logout";
                }
            });

            if("${page}" > "${pb.maxPcount}"){
                $("#page").val("${pb.maxPcount}");
                $("#actionForm").attr("action","/");
                $("#actionForm").submit();
            };

            $("#paging_wrap").on("click","span",function(){
                $("#page").val($(this).attr("page"));
                $("#actionForm").attr("action","/");
                $("#actionForm").submit();
            });

            $(".ob_list_wrap").on("click","#deleteBtn", function(){
                var no = $(this).parent().attr("no");
                $("#no").val(no);
                if(confirm("삭제하시겠습니까?")){
                    $("#actionForm").attr("action", "lineBoardDelete");
                    $("#actionForm").submit();
                }
            });

            $(".write_area #cancelBtn").on("click", function(){
                $(".write_con").val("");
                $(".write_area .action_btn").show();
                $(".write_area .action_btn2").hide();
            });

            $(".write_area #addBtn").on("click", function(){
                if(checkVal("#write_con")){
                    alert("내용을 입력해 주세요.");
                    $("#write_con").focus();
                } else {
                    $("#actionForm").attr("action","lineBoardAdd");
                    $("#actionForm").submit();
                }
            });

            $(".write_area #updateBtns").on("click", function(){
                if(checkVal("#write_con")){
                    alert("내용을 입력해 주세요.");
                    $("#write_con").focus();
                } else {
                    $("#actionForm").attr("action","lineBoardUpdate");
                    $("#actionForm").submit();
                }
            });
        });
    </script>
</head>
<body>
<div class="login_wrap">
    <c:choose>
        <c:when test="${empty sMNo}">
            <!-- 비 로그인 시 -->
            <input type="button" value="로그인" id="loginBtn" />
        </c:when>
        <c:otherwise>
            <!-- 로그인 시 -->
            ${sMNm}님 어서오십시오.  <input type="button" value="로그아웃" id="logoutBtn"/>
        </c:otherwise>
    </c:choose>
</div>
<div class="ob_wrap">
    <!-- Write -->
    <div class="write_area">
        <form action="#" id="actionForm" method="post">
            <c:choose>
                <c:when test="${empty sMNo}">
                    <!-- 비 로그인 시 -->
                    <input type="hidden" name="page" id="page" value="${page}" />
                    <div class="login_req_wrap">
                        <div class="login_req">
                            작성 시 로그인이 필요합니다. <input type="button" value="로그인" id="loginBtn" />
                        </div>
                    </div>

                </c:when>
                <c:otherwise>
                    <!-- 로그인 시 추가 -->
                    <input type="hidden" id="no" name="no" />
                    <input type="hidden" id="m_no" name="m_no" value="${sMNo}" />
                    <input type="hidden" name="page" id="page" value="${page}" />
                    <div class="user_info">
                        <div class="user_name">${sMNm}</div>
                    </div>
                    <div class="write_con_wrap">
                        <textarea class="write_con" name="write_con" id="write_con"></textarea>
                    </div>
                    <div class="btn_wrap">
                        <input type="button" value="저장" class="action_btn" id="addBtn" />
                        <input type="button" value="수정" class="action_btn2"
                               id="updateBtns" /> <input type="button" value="취소"
                                                         class="action_btn2" id="cancelBtn" />
                    </div>
                </c:otherwise>
            </c:choose>
        </form>
    </div>
    <!-- List -->
    <div class="ob_list_wrap">
        <c:choose>
            <c:when test="${fn:length(list) eq 0}">
                <!-- 데이터 없을 시 -->
                <div class="data_req_wrap">
                    <div class="data_req">데이터가 없습니다.</div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="data" items="${list}">
                    <div class="ob_data">
                        <div class="user_info">
                            <div class="user_name">${data.m_nm}</div>
                        </div>
                        <div class="con_info">
                            <div class="con">${data.o_con}</div>
                            <div class="date">작성시간 : ${data.dt}</div>
                        </div>
                        <div class="btn_wrap" no="${data.o_no}">
                            <c:if test="${data.m_no eq sMNo}">
                                <input type="button" value="수정" id="updateBtn" class="action_btn2" />
                                <input type="button" value="삭제" id="deleteBtn" class="action_btn2" />
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- Paging -->
    <div id="paging_wrap" class="paging_wrap">
        <span page="1">처음</span>
        <c:choose>
            <c:when test="${page eq 1}">
                <span page="1">이전</span>
            </c:when>
            <c:otherwise>
                <span page="${page - 1}">이전</span>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="${pb.startPcount}" end="${pb.endPcount}" step="1">
            <c:choose>
                <c:when test="${page eq i}">
                    <span page="${i}"><b>${i}</b></span>
                </c:when>
                <c:otherwise>
                    <span page="${i}">${i}</span>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${page eq pb.maxPcount}">
                <span page="${pb.maxPcount}">다음</span>
            </c:when>
            <c:otherwise>
                <span page="${page + 1}">다음</span>
            </c:otherwise>
        </c:choose>
        <span page="${pb.maxPcount}">마지막</span>
    </div>
</div>
</body>
</html>