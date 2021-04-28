/*
 * $Id: NewsletterServiceEJBTest.java,v 1.3 2009/03/19 14:13:29 lt-rico Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/03/19 14:13:29 $
 * Last changed by : $Author: lt-rico $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.legislation.NewsletterService;
import com.criticalsoftware.certitools.persistence.certitools.UserDAO;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;

/**
 * Newsletter service EJB
 *
 * @author : lt-rico
 */
public class NewsletterServiceEJBTest extends BaseTest {

    private NewsletterService newsletterService;

    private UserDAO userDAO;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            newsletterService = (NewsletterService) ctx.lookup("certitools/NewsletterService");
            userDAO = (UserDAO) ctx.lookup("certitools/UserDAO");

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
    public void testDAO() {
        System.out.println("************************************** "+userDAO.findAllForNewsletter().size());
        Assert.assertFalse(false);
    }

    @Test
    public void testNewsCRUD() {
        //newsletterService.sendNewsletters();
        Assert.assertFalse(false);
    }
}
