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

                <form role="form" action="/admin/editStudentInfo" id="editfrom" method="post">
                    <table class="table table-bordered " style="border-top: 1px solid #ddd">
                        <thead>
                        <tr>
                            <td class="col-md-1"><b>学号</b></td>
                            <td class="col-md-2">
                                <input readonly="readonly" type="text" class="form-control" id="inputid" name="userid"
                                       placeholder="学号" value="${studentInfo.userid}">
                            </td>
                            <td class="col-md-1"><b>姓名</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputname" name="username"
                                       placeholder="姓名"
                                       value="${studentInfo.username}">
                            </td>
                            <td class="col-md-1"><b>性别</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputsex" name="sex" placeholder="性别"
                                       value="${studentInfo.sex}"></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="col-md-1"><b>出生日期</b></td>
                            <td class="col-md-2">
                                <input type="date"
                                       value="<fmt:formatDate value="${studentInfo.birthyear}" dateStyle="medium" pattern="yyyy-MM-dd" />"
                                       name="birthyear"/>
                            </td>
                            <td class="col-md-1"><b>民族</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputnation" name="nation"
                                       placeholder="民族"
                                       value="${studentInfo.nation}">
                            </td>
                            <td class="col-md-1"><b>语言</b></td>
                            <td class="col-md-2"><input type="text" class="form-control" id="inputlanguage"
                                                        name="language"
                                                        placeholder="语言" value="${studentInfo.language}"></td>
                        </tr>
                        <tr>
                            <td class="col-md-2"><b>家庭现住址</b></td>
                            <td colspan="5" class="col-md-10">
                                <input type="text" class="form-control" id="inputaddress" name="address"
                                       placeholder="家庭现住址" value="${studentInfo.address}">
                            </td>
                        </tr>
                        <tr>
                            <td class="col-md-1"><b>籍贯</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputhometown" name="hometown"
                                       placeholder="籍贯" value="${studentInfo.hometown}">
                            </td>
                            <td class="col-md-1"><b>邮政编码</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputpostcode" name="postcode"
                                       placeholder="邮政编码" value="${studentInfo.postcode}">
                            </td>
                            <td class="col-md-1"><b>手机号码</b></td>
                            <td class="col-md-2">
                                <input type="text" class="form-control" id="inputphone" name="phone"
                                       placeholder="手机号码"
                                       value="${studentInfo.phone}">
                            </td>
                        </tr>
                        <%--                    ---------------------------------------------%>
                        <tr>
                            <td class="col-md-1"><b>学习形式</b></td>
                            <td class="col-md-2">${studentInfo.hometown}</td>
                            <td class="col-md-1"><b>学习层次</b></td>
                            <td class="col-md-2">${studentInfo.postcode}</td>
                            <td class="col-md-1"><b>外语语种</b></td>
                            <td class="col-md-2">${studentInfo.phone}</td>
                        </tr>
                        <tr>
                            <td class="col-md-1"><b>联系人</b></td>
                            <td class="col-md-2">${studentInfo.hometown}</td>
                            <td class="col-md-1"><b>政治面貌</b></td>
                            <td class="col-md-2">${studentInfo.postcode}</td>
                            <td class="col-md-1"><b>婚否</b></td>
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
                </form>

                <div class="panel-footer">
                    <div class="col-md-10"></div>
                    <button class="btn btn-primary" onclick="submitForm()">提交</button>
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
function submitForm(){
    document.forms.item(1).submit();
}
</script>
</html>