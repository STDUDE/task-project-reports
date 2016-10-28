package com.task.reports.dao;

import com.task.reports.domain.Reports;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;


@Repository
public class ReportsDAOImpl implements ReportsDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Reports> listReports() {
        return sessionFactory.getCurrentSession().createQuery("from Reports").list();
    }

    @SuppressWarnings("unchecked")
    public List<Reports> listReportsFiltered(Date startDate, Date endDate, String performer) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Reports.class);
        if (startDate != null) {
            criteria.add(Restrictions.eq("start_date", startDate));
        }
        if (endDate != null) {
            criteria.add(Restrictions.eq("end_date", endDate));
        }
        if (performer != null) {
            criteria.add(Restrictions.eq("performer", performer));
        }
        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public List<String> listPerformers() {
        Query query = sessionFactory.getCurrentSession().createQuery("select R.performer from Reports R");
        return (List<String>) query.list();
    }

    @SuppressWarnings("unchecked")
    public Reports getReport(int id) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Reports where id=" + id);
        return (Reports) query.uniqueResult();
    }
}
