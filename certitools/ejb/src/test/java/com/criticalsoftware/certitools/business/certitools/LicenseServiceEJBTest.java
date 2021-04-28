/*
 * $Id: LicenseServiceEJBTest.java,v 1.2 2009/03/09 19:23:43 jp-gomes Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 * 
 * Last changed on $Date: 2009/03/09 19:23:43 $
 * Last changed by $Author: jp-gomes $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.exception.BusinessException;
import com.criticalsoftware.certitools.business.license.LicenseService;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.AfterClass;
import org.testng.annotations.Test;
import static org.testng.Assert.assertTrue;

import javax.naming.InitialContext;
import java.util.Date;

/**
 * License Service Tester
 *
 * @author haraujo
 */
public class LicenseServiceEJBTest extends BaseTest {
    private LicenseService licenseService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            licenseService = (LicenseService) ctx.lookup("certitools/LicenseService");
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
        /*try {
           *String key = licenseService.generate(1, new Date(), new Date());
            System.out.println("KEY: " + key);
            assertTrue(key.length()> 0);
        } catch (BusinessException e) {
            e.printStackTrace();
        }*/
    }
}
