package com.task.reports.test;


import com.task.reports.domain.Reports;
import com.task.reports.service.ReportsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Antony on 04.09.2016.
 */
public class Test {
    @Autowired
    static ReportsService reportsService;

    public static void main(String... args) {
        List<Reports> reports = reportsService.listReports();
        System.out.println(reports.get(0).getPerformer());
    }
}
