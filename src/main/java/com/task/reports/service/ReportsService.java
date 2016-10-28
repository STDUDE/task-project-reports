package com.task.reports.service;

import com.task.reports.domain.Reports;

import java.util.Date;
import java.util.List;

/**
 * Created by Antony on 26.10.2016.
 */

public interface ReportsService {
    public List<Reports> listReports();
    public List<Reports> listReportsFiltered(Date startDate, Date endDate, String performer);
    public List<String> listPerformers();

    public Reports getReport(int id);
}
