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

    <title><spring:message code="common.title"/></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/bootstrap-datepicker3.min.css" type="text/css" media="screen"/>


    <!-- Customizable CSS -->
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">


</head>
<body>

<div class="wrapper">
    <div class="container">
        <c:if test="${!empty reports}">
            <section class="bgcolor-2">
                <table class="result-tab">
                    <thead>
                    <tr>
                        <th>№</th>
                        <th>StartDate</th>
                        <th>EndDate</th>
                        <th>Performer</th>
                        <th>Activity</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${reports}" var="report" varStatus="loop">
                        <tr>
                            <td>${loop.index+1}</td>
                            <td>${report.startDate}</td>
                            <td>${report.endDate}</td>
                            <td>${report.performer}</td>
                            <td>${report.activity}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </c:if>
        <hr>
        <c:if test="${!empty performers}">
            <div id="filter-form">
                <form method="get" action="/">
                    <section>
                        <h2 class="content bgcolor-4">Dates</h2>
                        <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" id="start" name="start"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" id="end" name="end"/>
                        </div>
                    </section>
                    <section>
                        <h2 class="content bgcolor-4">Performer</h2>
                        <select id="performer" name="performer">
                            <option><spring:message code="performers.list.first"/></option>
                            <c:forEach items="${performers}" var="performer" varStatus="loop">
                                <option>${performer}</option>
                            </c:forEach>
                        </select>
                    </section>
                    <section>
                        <h2 class="content bgcolor-4"><spring:message code="commons.timePeriod"/></h2>
                        <select id="timePeriod">
                            <c:forEach items="${timePeriod}" var="period" varStatus="loop">
                                <option value="period${loop.index+1}" id="period${loop.index+1}">${period}</option>
                            </c:forEach>
                        </select>
                    </section>
                    <input name="show" type="submit" class="button" value="Show">
                </form>
            </div>
        </c:if>
    </div>
</div>

<script src="resources/js/jquery-3.1.1.js"></script>
<script src="resources/js/moment.js"></script>

<script src="resources/js/bootstrap-datepicker.min.js"></script>
<script src="resources/js/locales/bootstrap-datepicker.en-GB.min.js" charset="UTF-8"></script>
<script src="resources/js/main.js" charset="UTF-8"></script>


</body>
</html>