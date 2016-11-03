package com.task.reports.dao;

import com.task.reports.domain.Reports;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (startDate != null) {
            try {
                criteria.add(Restrictions.ge("startDate", sdf.parse(sdf.format(startDate))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (endDate != null) {
            try {
                criteria.add(Restrictions.le("endDate", sdf.parse(sdf.format(endDate))));
            } catch (ParseException e) {
                e.printStackTrace();
            }
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
