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
                    <input name="find" type="submit" class="button" value="Показать">
                </form>
            </div>
        </c:if>
        <c:if test="${!empty reports}">
            <section class="bgcolor-2">
                <table>
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
    </div>
</div>

<script src="resources/js/jquery-3.1.1.js"></script>
<script src="resources/js/moment.js"></script>

<script src="resources/js/bootstrap-datepicker.min.js"></script>
<script src="resources/js/locales/bootstrap-datepicker.en-GB.min.js" charset="UTF-8"></script>


<script>
    $(document).ready(function () {
        $('.input-daterange').datepicker({
            format: "M dd, yyyy",
            weekStart: 1,
            endDate: "today",
            todayBtn: "linked",
            clearBtn: true,
            daysOfWeekHighlighted: "0,6",
            todayHighlight: true
        });

        $(".datepicker table tr td, .datepicker table tr th").css("border-radius", "0");

        var quarterAdjustment = 1;

        var sDateLastQtr = moment().subtract(quarterAdjustment, 'quarter').startOf('quarter');
        var eDateLastQtr = moment().subtract(quarterAdjustment, 'quarter').endOf('quarter');

        var $datepicker = $('.input-daterange');
        var startDate = sDateLastQtr.toDate();
        var endDate = eDateLastQtr.toDate();

        $datepicker.find('#start').datepicker('update', startDate);
        $datepicker.find('#end').datepicker('update', endDate);
        $datepicker.data('datepicker').updateDates();

        $('#timePeriod').on("change", function (event) {
            var id = $(this).children(":selected").attr("value");
            var param = "";

            switch (id) {
                case "period1":
                {
                    //Last Qtr
                    quarterAdjustment = 1;
                    param = "quarter";
                }
                    break;
                case "period2":
                {
                    //Last Month
                    quarterAdjustment = 1;
                    param = "month";
                }
                    break;
                case "period3":
                {
                    //Last Calendar Year
                    quarterAdjustment = 1;
                    param = "year";
                }
                    break;
                case "period4":
                {
                    //Current Year to Date
                    quarterAdjustment = 0;
                    param = "year";
                }
                    break;
                case "period5":
                {
                    //Current Qtr to Date
                    quarterAdjustment = 0;
                    param = "quarter";
                }
                    break;
                case "period6":
                {
                    //Current Month to Date
                    quarterAdjustment = 0;
                    param = "month";
                }
                    break;
            }

            var sDate = moment().subtract(quarterAdjustment, param).startOf(param);
            console.log(sDate.format('MMM DD, YYYY'));
            var eDate = moment().subtract(quarterAdjustment, param).endOf(param);
            console.log(eDate.format('MMM DD, YYYY'));

            var $datepicker = $('.input-daterange');
            var startDate = sDate.toDate();
            var endDate = (quarterAdjustment == 0) ? moment().startOf('day').toDate() : eDate.toDate();

            $datepicker.find('#start').datepicker('update', startDate);
            $datepicker.find('#end').datepicker('update', endDate);
            $datepicker.data('datepicker').updateDates();
        });

    });

</script>
</body>
</html>