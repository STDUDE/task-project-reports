package com.task.reports.web;

import com.task.reports.service.ReportsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.Map;

@Controller
public class ReportsMainController {

    @Autowired
    private ReportsService reportsService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(@RequestParam(value = "startDate", required = false) Date startDate,
                             @RequestParam(value = "endDate", required = false) Date endDate,
                             @RequestParam(value = "performer", required = false) String performer,
                             Map<String,Object> map) {
        if(startDate == null && endDate == null && performer == null) {
            map.put("reports", reportsService.listReports());
        } else {
            map.put("reports", reportsService.listReportsFiltered(startDate, endDate, performer));
        }
        map.put("performers", reportsService.listPerformers());
        return new ModelAndView("index", map);
    }

    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public void error403() { }

    @RequestMapping(value = "/error404", method = RequestMethod.GET)
    public void error404() { }

    @RequestMapping(value = "/error500", method = RequestMethod.GET)
    public void error500() { }

}
