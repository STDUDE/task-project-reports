package com.task.reports.web;

import com.task.reports.domain.Reports;
import com.task.reports.service.ReportsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@Configuration
@PropertySource(value="classpath:messages.properties")
public class ReportsMainController {

    @Autowired
    private ReportsService reportsService;

    @Value("#{'${commons.timePeriod.list}'.split(',')}")
    private List<String> timePeriod;

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @RequestMapping(value = "/", method =  { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView home(@RequestParam(value = "start", required = false) Date startDate,
                             @RequestParam(value = "end", required = false) Date endDate,
                             @RequestParam(value = "performer", required = false) String performer,
                             @RequestParam(value = "show", required = false) String show,
                             Map<String,Object> map) {
        List<Reports> reports;
        String result = "No results for this request";
       /* System.out.println("start: " + startDate+ " end: " + endDate);*/
        if(performer != null && performer.equals("All performers")) {
            performer = null;
        }
        if(show != null && show.toUpperCase().equals("SHOW")) {
            if(startDate == null && endDate == null && performer == null) {
                reports = reportsService.listReports();

            } else {
                reports = reportsService.listReportsFiltered(startDate, endDate, performer);
            }
            map.put("reports", reports);
            if(reports.size() == 0)
                map.put("result", result);
        }

        map.put("performers", reportsService.listPerformers());
        map.put("timePeriod", timePeriod);
        return new ModelAndView("index", map);
    }

    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public void error403() { }

    @RequestMapping(value = "/error404", method = RequestMethod.GET)
    public void error404() { }

    @RequestMapping(value = "/error500", method = RequestMethod.GET)
    public void error500() { }

}
