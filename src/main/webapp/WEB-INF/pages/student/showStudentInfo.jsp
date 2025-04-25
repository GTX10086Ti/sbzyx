<jsp:useBean id="studentInfo" scope="request" type="zsc.j2e.entity.StudentInfoCustom"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 顶栏 -->
<jsp:include page="top.jsp"/>
<!-- 中间主体 -->
<div class="container" id="content">
    <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 style="text-align: center;">学籍信息</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">院系：${studentInfo.collegeName}</div>
                    <div class="col-md-3">
                        专业：
                        <c:choose>
                            <c:when test="${studentInfo.collegeName.equals(\"计算机学院\")}">
                                软件工程
                            </c:when>
                            <c:when test="${studentInfo.collegeName.equals(\"电子信息学院\")}">
                                通信工程
                            </c:when>
                            <c:when test="${studentInfo.collegeName.equals(\"机电工程学院\")}">
                                自动化
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="col-md-3">学制：4</div>
                    <div class="col-md-3">学号：${studentInfo.userid}</div>
                </div>

                <table class="table table-bordered " style="border-top: 1px solid #ddd">
                    <thead>
                    <tr>
                        <td class="col-md-1"><b>学号</b></td>
                        <td class="col-md-2">${studentInfo.userid}</td>
                        <td class="col-md-1"><b>姓名</b></td>
                        <td class="col-md-2">${studentInfo.username}</td>
                        <td class="col-md-1"><b>性别</b></td>
                        <td class="col-md-2">${studentInfo.sex}</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="col-md-1"><b>出生日期</b></td>
                        <td class="col-md-2"><fmt:formatDate value="${studentInfo.birthyear}" dateStyle="medium"/></td>
                        <td class="col-md-1"><b>民族</b></td>
                        <td class="col-md-2">${studentInfo.nation}</td>
                        <td class="col-md-1"><b>语言</b></td>
                        <td class="col-md-2">${studentInfo.language}</td>
                    </tr>
                    <tr>
                        <td class="col-md-2"><b>家庭现住址</b></td>
                        <td colspan="5" class="col-md-10">${studentInfo.address}</td>
                    </tr>
                    <tr>
                        <td class="col-md-1"><b>籍贯</b></td>
                        <td class="col-md-2">${studentInfo.hometown}</td>
                        <td class="col-md-1"><b>邮政编码</b></td>
                        <td class="col-md-2">${studentInfo.postcode}</td>
                        <td class="col-md-1"><b>手机号码</b></td>
                        <td class="col-md-2">${studentInfo.phone}</td>
                    </tr>
<%--                    ---------------------------------------------%>
                    <tr>
                        <td class="col-md-1"><b>电子邮箱</b></td>
                        <td class="col-md-2">${studentInfo.email}</td>
                        <td class="col-md-1"><b>政治面貌</b></td>
                        <td class="col-md-2">${studentInfo.postcode}</td>
                        <td class="col-md-1"><b>婚否</b></td>
                        <td class="col-md-2">${studentInfo.phone}</td>
                    </tr>
                    <tr>
                        <td class="col-md-1"><b>学习形式</b></td>
                        <td class="col-md-2">${studentInfo.hometown}</td>
                        <td class="col-md-1"><b>学习层次</b></td>
                        <td class="col-md-2">${studentInfo.postcode}</td>
                        <td class="col-md-1"><b>外语语种</b></td>
                        <td class="col-md-2">${studentInfo.phone}</td>
                    </tr>
                    <tr>
                        <td class="col-md-1"><b>专业方向</b></td>
                        <td class="col-md-2">${studentInfo.hometown}</td>
                        <td class="col-md-1"><b>专业代码</b></td>
                        <td class="col-md-2">${studentInfo.postcode}</td>
                        <td class="col-md-1"><b>家庭电话</b></td>
                        <td class="col-md-2">${studentInfo.phone}</td>
                    </tr>
                    </tbody>
                </table>

                <div class="panel-footer">
                    <div class="col-md-10"></div>
                        <button class="btn btn-default btn-md btn-info" onclick="modify()">修改</button>
                </div>
            </div>
    </div>
</div>

<div class="container" id="footer">
    <div class="row">
        <div class="col-md-12"></div>
    </div>
</div>
</body>
<script type="text/javascript">

    $("#nav li:nth-child(2)").addClass("active")
    <c:if test="${pagingVO != null}">
    if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
        $(".pagination li:last-child").addClass("disabled")
    };

    if (${pagingVO.curentPageNo} == ${1}) {
        $(".pagination li:nth-child(1)").addClass("disabled")
    };
    </c:if>
function modify(){
    alert("请联系管理员修改");
}
</script>
</html>