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
        <div class="row">
            <div class="col-md-8 center-block">
                <div class="info-404 text-center">
                    <h2 class="primary-color inner-bottom-xs">403</h2>

                    <h1 class="lead"><spring:message code="error.full403"/></h1>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="resources/js/jquery-3.1.1.js"></script>
<script src="resources/js/moment.js"></script>

<script src="resources/js/bootstrap-datepicker.min.js"></script>
<script src="resources/js/locales/bootstrap-datepicker.en-GB.min.js" charset="UTF-8"></script>
</body>
</html>