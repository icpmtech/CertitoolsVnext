/*
 * $Id: NewsServiceEJBTest.java,v 1.7 2009/03/23 23:46:09 lt-rico Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 * 
 * Last changed on $Date: 2009/03/23 23:46:09 $
 * Last changed by $Author: lt-rico $
 */
package com.criticalsoftware.certitools.business.certitools;

import com.criticalsoftware.certitools.BaseTest;
import com.criticalsoftware.certitools.business.exception.ObjectNotFoundException;
import com.criticalsoftware.certitools.entities.News;
import com.criticalsoftware.certitools.entities.NewsCategory;
import org.apache.commons.lang.StringUtils;
import static org.testng.Assert.assertTrue;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.List;

/**
 * News Service Test
 *
 * @author pjfsilva
 */
public class NewsServiceEJBTest extends BaseTest {
    private NewsService newsService;

    @BeforeClass
    public void setUp() {
        System.out.println("startupEmbeddedJboss");
        startupEmbeddedJboss();

        try {
            InitialContext ctx = getInitialContext();
            newsService = (NewsService) ctx.lookup("certitools/NewsService");
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
    public void testNewsCRUD() throws ObjectNotFoundException {
        // check if news categories are ok
        List<NewsCategory> originalNewsCategories = new ArrayList<NewsCategory>(newsService.findAllNewsCategories());
        assertTrue(originalNewsCategories.size() == 2);

        // test news categories update
        newsService.updateNewsCategory("news category test 1", "news category test 2 cvb");
        List<NewsCategory> newsCategoriesChanged = new ArrayList<NewsCategory>(newsService.findAllNewsCategories());
        assertTrue(newsCategoriesChanged.size() == 2);

        assertTrue(StringUtils.equals(newsCategoriesChanged.get(0).getName(), "news category test 1"));
        assertTrue(StringUtils.equals(newsCategoriesChanged.get(1).getName(), "news category test 2 cvb"));

        newsService
                .updateNewsCategory(originalNewsCategories.get(0).getName(), originalNewsCategories.get(1).getName());

        // test news CRUD
        News news = new News();
        news.setTitle("news test title");
        news.setContent("news test content LoreLorem ipsum dolor sit amet, consectetuLorem ipsum dolo"
                + "Lorem ipsum dolor sit amet, consectetuLorem ipsum dolor sit amet, consectetur Lorem ipsum dolor s"
                + "it amet, consectetuLorem ipsum dolor sit amet, consectetusit amet, consectetun ");
        news.setCategory(originalNewsCategories.get(0));

        List<News> newsOriginal = (List<News>) newsService.findAllNews();

        News news1 = newsService.insertNews(news);

        news = new News();
        news.setTitle("news test title 2");
        news.setContent("news test content LoreLorem ipsum dolor sit amet, consectetuLorem ipsum dolo"
                + "Lorem ipsum dolor sit amet, consectetuLorem ipsum dolor sit amet, consectetur Lorem ipsum dolor s"
                + "it amet, consectetuLorem ipsum dolor sit amet, consectetusit amet, consectetun ");
        news.setCategory(originalNewsCategories.get(1));
        News news2 = newsService.insertNews(news);

        news = new News();
        news.setTitle("news test title 3");
        news.setContent("news test content LoreLorem ipsum dolor sit amet, consectetuLorem ipsum dolo"
                + "Lorem ipsum dolor sit amet, consectetuLorem ipsum dolor sit amet, consectetur Lorem ipsum dolor s"
                + "it amet, consectetuLorem ipsum dolor sit amet, consectetusit amet, consectetun ");
        news.setCategory(originalNewsCategories.get(1));
        News news3 = newsService.insertNews(news);

        List<News> newsChanged = (List<News>) newsService.findAllNews();
        assertTrue(newsOriginal.size() + 3 == newsChanged.size());

        newsService.deleteNews(news2.getId());
        newsChanged = (List<News>) newsService.findAllNews();
        assertTrue(newsOriginal.size() + 2 == newsChanged.size());

        // update
        String news1OriginalTitle = news1.getTitle();
        news1.setTitle("news changed title");
        newsService.updateNews(news1);
        news1 = newsService.findNews(news1.getId());
        assertTrue(!StringUtils.equals(news1OriginalTitle, news1.getTitle()));

        news1.setTitle(news1OriginalTitle);
        newsService.updateNews(news1);
        news1 = newsService.findNews(news1.getId());
        assertTrue(StringUtils.equals(news1OriginalTitle, news1.getTitle()));

        newsService.deleteNews(news1.getId());
        newsChanged = (List<News>) newsService.findAllNews();
        assertTrue(newsOriginal.size() + 1 == newsChanged.size());

        // toggle published status
        newsService.toggleNewsPublishedStatus(news3.getId());
        news3 = newsService.findNews(news3.getId());
        assertTrue(news3.isPublished());

        newsService.toggleNewsPublishedStatus(news3.getId());
        news3 = newsService.findNews(news3.getId());
        assertTrue(!news3.isPublished());

        newsService.deleteNews(news3.getId());
        newsChanged = (List<News>) newsService.findAllNews();
        assertTrue(newsOriginal.size() == newsChanged.size());
    }
}
