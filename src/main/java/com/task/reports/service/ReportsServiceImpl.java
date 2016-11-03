package com.task.reports.service;

import com.task.reports.dao.ReportsDAO;
import com.task.reports.domain.Reports;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ReportsServiceImpl implements ReportsService {

    @Autowired
    private ReportsDAO reportsDAO;

    @Transactional
    public List<Reports> listReports() {
        return (List<Reports>)reportsDAO.listReports();
    }

    @Transactional
    public List<Reports> listReportsFiltered(Date startDate, Date endDate, String performer) {
        return (List<Reports>)reportsDAO.listReportsFiltered(startDate, endDate, performer);
    }

    @Transactional
    public List<String> listPerformers() {
        return reportsDAO.listPerformers();
    }

    @Transactional
    public Reports getReport(int id) {
        return reportsDAO.getReport(id);
    }
}
