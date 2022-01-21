function checkVal(sel){
    if($.trim($(sel).val()) == ""){
        return true;
    } else {
        return false;
    }
};

$(document).ready(function() {
    //목록에서 수정버튼을 클릭했을때
    $(".ob_list_wrap").on("click", "#updateBtn", function () {
        //#update_Btn > .btn_wrap > .ob_data > .con_info > .con
        var con = $(this).parent().parent().children(".con_info").children(".con").html();
        var no = $(this).parent().attr("no");
        $(".write_con").val(con);
        $("#no").val(no);
        $(".write_area .action_btn").hide();
        $(".write_area .action_btn2").show();
    });

    $("body").on("click", "#loginBtn", function () {
        location.href = "login";
    });

    $("#logoutBtn").on("click", function () {
        if (confirm("로그 아웃 하시겠습니까?")) {
            location.href = "logout";
        }
    });

    if ("${page}" > "${pb.maxPcount}") {
        $("#page").val("${pb.maxPcount}");
        $("#actionForm").attr("action", "lineBoard");
        $("#actionForm").submit();
    };

    $("#paging_wrap").on("click", "span", function () {
        $("#page").val($(this).attr("page"));
        $("#actionForm").attr("action", "lineBoard");
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
