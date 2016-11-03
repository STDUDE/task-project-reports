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