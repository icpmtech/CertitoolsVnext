/*
 * $Id: FAQServiceEJBTest.java,v 1.4 2009/04/09 16:06:23 lt-rico Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/04/09 16:06:23 $
 * Last changed by : $Author: lt-rico $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.exception.CertitoolsAuthorizationException;
import com.criticalsoftware.certitools.business.exception.ObjectNotFoundException;
import com.criticalsoftware.certitools.entities.FAQ;
import com.criticalsoftware.certitools.entities.FAQCategory;
import com.criticalsoftware.certitools.entities.Module;
import com.criticalsoftware.certitools.util.ModuleType;
import static org.testng.Assert.assertTrue;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;
import java.util.List;

/**
 * FAQ Service Test
 *
 * @author jp-gomes
 */
public class FAQServiceEJBTest extends BaseTest {
    private FAQService faqService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            faqService = (FAQService) ctx.lookup("certitools/FAQService");

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
    public void testFAQCRUD() throws ObjectNotFoundException, CertitoolsAuthorizationException {

        //--Insert
        List<FAQ> beforeList = faqService.findAllFAQ(1L);

        //New FAQ and new Category Test for legislation
        Module module = new Module();
        module.setModuleType(ModuleType.LEGISLATION);

        FAQCategory faqCategory = new FAQCategory();
        faqCategory.setName("Categoria de teste");
        faqCategory.setModule(module);

        FAQ faq = new FAQ();
        faq.setQuestion("Test Question");
        faq.setAnswer("TEst Answer");
        faq.setFaqCategory(faqCategory);

        faqService.insertFAQ(1L, faq);

        // New FAQ with last created FAQ Category and module

        faq = new FAQ();
        faq.setQuestion("Test Question 2");
        faq.setAnswer("TEst Answer 2");
        faq.setFaqCategory(faqCategory);
        faqService.insertFAQ(1L, faq);

        List<FAQ> afterList = faqService.findAllFAQ(1L);

        assertTrue(beforeList.size() + 2 == afterList.size());

        //--Update
        faq = faqService.findFAQWithCategoryAndModule(1L, 1L);

        //Change Module and FAQ Category and FAQ
        faq.getFaqCategory().getModule().setModuleType(ModuleType.PEI);
        faq.setAnswer("TEst Answer 3");
        faq.setQuestion("Test Question 3");

        faqService.updateFAQ(faq, 1L);

        faq = faqService.findFAQWithCategoryAndModule(1L, 1L);

        assertTrue("TEst Answer 3".equals(faq.getAnswer()));

        faqService.deleteFAQ(1L, 1L);
    }
}
