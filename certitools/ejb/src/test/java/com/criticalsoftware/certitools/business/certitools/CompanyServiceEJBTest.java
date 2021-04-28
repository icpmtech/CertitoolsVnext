/*
 * $Id: CompanyServiceEJBTest.java,v 1.2 2009/03/31 17:11:24 pjfsilva Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/03/31 17:11:24 $
 * Last changed by : $Author: pjfsilva $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.certitools.CompanyService;
import com.criticalsoftware.certitools.entities.Company;
import static org.testng.Assert.assertTrue;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;
import java.util.Collection;

/**
 * <description>
 *
 * @author jp-gomes
 */

public class CompanyServiceEJBTest extends BaseTest {
    private CompanyService companyService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            companyService = (CompanyService) ctx.lookup("certitools/CompanyService");
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
    public void testGenerate() {
        //Collection<Company> companyList = companyService.findAll();
        //assertTrue(companyList.size() > 0);
    }
}


