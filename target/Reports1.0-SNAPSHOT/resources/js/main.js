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

    var jVal = {
        'startDate': function () {

            $('body').append('<div id="startDateInfo" class="info"></div>');

            var startDateInfo = $('#startDateInfo');
            var ele = $('#start');
            var pos = ele.offset();

            startDateInfo.css({
                top: pos.top + 2.5,
                left: pos.left + ele.width() - 10
            });

            if (ele.val().length == 0) {
                jVal.errors = true;
                startDateInfo.removeClass('correct').addClass('error').html('&larr; Incorrect date ').show();
                ele.removeClass('normal').addClass('wrong');
            } else {
                startDateInfo.removeClass('error').addClass('correct').html('&radic;').show();
                ele.removeClass('wrong').addClass('normal');
            }
        },
        'endDate': function () {

            $('body').append('<div id="endDateInfo" class="info"></div>');

            var endDateInfo = $('#endDateInfo');
            var ele = $('#end');
            var pos = ele.offset();

            endDateInfo.css({
                top: pos.top + 2.5,
                left: pos.left + ele.width() - 10
            });

            if (ele.val().length == 0) {
                jVal.errors = true;
                endDateInfo.removeClass('correct').addClass('error').html('&larr; Incorrect date ').show();
                ele.removeClass('normal').addClass('wrong');
            } else {
                endDateInfo.removeClass('error').addClass('correct').html('&radic;').show();
                ele.removeClass('wrong').addClass('normal');
            }
        },
        'sendIt': function () {
            if (!jVal.errors) {
                $('#startDateInfo').remove();
                $('#endDateInfo').remove();
                var input = $("<input>")
                    .attr("type", "hidden")
                    .attr("name", "show").val("show");
                $('#form').append($(input));
                $('#form').submit();
            }
        }
    };

    $('#show').click(function (){
        var obj = $.browser ? $('body') : $('html');
        obj.animate({ scrollTop: $('#form').offset().top }, 750, function (){
            jVal.errors = false;
            jVal.startDate();
            jVal.endDate();
            jVal.sendIt();
        });
        return false;
    });

    $('#start').change(jVal.startDate);
    $('#end').change(jVal.endDate);
});