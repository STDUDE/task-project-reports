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
    <link rel="stylesheet" href="resources/css/bootstrap-datepicker3.min.css" type="text/css" media="screen" />


    <!-- Customizable CSS -->
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">

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
        <c:if test="${!empty performers}">
            <div id="filter-form">
                <form:form method="get" action="/">
                    <section>
                        <h2 class="content bgcolor-4">Dates</h2>
                        <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" name="start" />
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" name="end" />
                        </div>
                    </section>
                    <section>
                        <h2 class="content bgcolor-4">Performer</h2>
                        <select id="performer">
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
                                <option id="period${loop.index+1}">${period}</option>
                            </c:forEach>
                        </select>
                    </section>
                    <input name="find" type="submit" class="button" value="Показать">
                </form:form>
            </div>
        </c:if>

        <div id="result-tab">

        </div>


    </div>
    </div>

    <script src="resources/js/jquery-3.1.1.js"></script>

    <script src="resources/js/bootstrap-datepicker.min.js"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ar.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.az.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.bg.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.bs.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ca.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.cs.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.cy.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.da.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.de.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.el.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.en-GB.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.es.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.et.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.eu.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.fa.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.fi.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.fo.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.fr.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.fr-CH.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.gl.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.he.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.hr.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.hu.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.hy.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.id.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.is.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.it.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.it-CH.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ja.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ka.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.kh.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.kk.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.kr.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.lt.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.lv.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.mk.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ms.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.nb.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.nl.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.nl-BE.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.no.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.pl.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.pt-BR.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.pt.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ro.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.rs.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.rs-latin.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.ru.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sk.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sl.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sq.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sr.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sr-latin.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sv.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.sw.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.th.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.tr.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.uk.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.vi.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
    <script src="resources/js/locales/bootstrap-datepicker.zh-TW.min.js" charset="UTF-8"></script>

    <script>
        $('.input-daterange').datepicker({
            format: "M dd, yyyy",
            weekStart: 1,
            todayBtn: "linked",
            clearBtn: true,
            daysOfWeekHighlighted: "0,6",
            todayHighlight: true
        });
        $('.timePeriod').bind('change', function () {
            var id = $(this).children(":selected").attr("id");
            console.log("ID: "+ id);
            switch (id) {
                case "period1":
                    break;
                case "period2":
                    break;
                case "period3":
                    break;
                case "period4":
                    break;
                case "period5":
                    break;
                case "period6":
                    break;
            }
        });

    </script>
</body>
</html>