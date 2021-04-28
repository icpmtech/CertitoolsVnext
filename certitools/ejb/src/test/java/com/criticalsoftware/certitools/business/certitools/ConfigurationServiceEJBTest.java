/*
 * $Id: ConfigurationServiceEJBTest.java,v 1.1 2009/03/09 18:56:26 haraujo Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/03/09 18:56:26 $
 * Last changed by : $Author: haraujo $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.certitools.ConfigurationService;
import static org.testng.Assert.assertTrue;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;
import java.util.Map;

/**
 * Test Class for ConfigurationServiceEJB
 *
 * @author : jp-gomes
 */
public class ConfigurationServiceEJBTest extends BaseTest {
    private ConfigurationService configurationService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            configurationService = (ConfigurationService) ctx.lookup("certitools/ConfigurationService");
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
    public void testFindAll() {
        Map<String, String> configurations = configurationService.findAllInMap();
        assertTrue(configurations.size() > 0);
    }
}

