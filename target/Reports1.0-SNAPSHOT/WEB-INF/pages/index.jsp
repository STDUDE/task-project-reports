<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content='<spring:message code="common.keywords"/>'>
    <meta name="description" content='<spring:message code="common.description"/>'>

    <title><spring:message code="common.plywoodTitle"/></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" media="screen"/>

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="resourcew/css/style.css" type="text/css" media="screen">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css" media="screen"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">


</head>
<body>

<div class="wrapper">
    <div class="container">
        <c:if test="${!empty performer}">
            <div id="filter-form">
                <form:form method="post" action="">
                    <section>
                        <h2 class="content bgcolor-4">Start date</h2>
                        <hr>
                        <input type="text" size="40" class="date" id="start_date" name="start_date">
                    </section>
                    <section>
                        <h2 class="content bgcolor-4">End date</h2>
                        <hr>
                        <input type="text" size="40" class="date" id="end_date" name="end_date">
                    </section>
                    <section>
                        <h2 class="content bgcolor-4">Performer</h2>
                        <hr>
                        <select>
                            <option>All performers</option>
                            <c:forEach items="${performers}" var="performer" varStatus="loop">
                                <option>${performer}</option>
                            </c:forEach>
                        </select>
                        <input type="text" size="40" class="date" id="performer" name="performer">
                    </section>
                    <section>
                        <h2 class="content bgcolor-4">Performer</h2>
                        <hr>
                        <select>
                            <c:forEach items="${performers}" var="performer" varStatus="loop">
                                <option>${performer}</option>
                            </c:forEach>
                        </select>
                    </section>
                    <input name="find" type="submit" value="Показать">
                </form:form>
            </div>
        </c:if>
        <div id="result-tab">

        </div>


    </div>

    <script src="resources/js/jquery-1.10.2.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

</body>
</html>