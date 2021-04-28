/*
 * $Id: LegislationServiceEJBTest.java,v 1.3 2009/04/06 11:33:52 lt-rico Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/04/06 11:33:52 $
 * Last changed by : $Author: lt-rico $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.legislation.LegislationService;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;
import java.util.Calendar;
import java.util.Date;

/**
 * <insert description here>
 *
 * @author : lt-rico
 */
public class LegislationServiceEJBTest extends BaseTest {

    private LegislationService legislationService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            legislationService = (LegislationService) ctx.lookup("certitools/LegislationService");

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error when trying to lookup the service.");
        }
    }

    @AfterClass
    public void tearDown() {
        System.out.println("shutdownEmbeddedJboss");
        shutdownEmbeddedJboss();
    }

    @Test
    public void getStats() {

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 1900);
        Date init = calendar.getTime();
        calendar.set(Calendar.YEAR, 2010);
        Date end = calendar.getTime();

        System.out.println("INIT DATE " + init);
        System.out.println("END DATE " + end);
        Assert.assertFalse(false);
    }
}
