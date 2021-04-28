/*
 * $Id: BaseTest.java,v 1.3 2009/03/02 20:39:39 haraujo Exp $
 *
 * Copyright (c) Critical Software S.A., All Rights Reserved.
 * (www.criticalsoftware.com)
 *
 * This software is the proprietary information of Critical Software S.A.
 * Use is subject to license terms.
 *
 * Last changed on : $Date: 2009/03/02 20:39:39 $
 * Last changed by : $Author: haraujo $
 */
package com.criticalsoftware.certitools;

import java.util.Hashtable;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.jboss.ejb3.embedded.EJB3StandaloneBootstrap;

/**
 * Base test class.
 *
 * @author : Hugo Araújo
 * @version : $Revision: 1.3 $
 */
public class BaseTest {
    protected static void startupEmbeddedJboss() {
        StringTokenizer tokenizer = new StringTokenizer(System.getProperty("java.class.path"), ";");
        System.out.println("-- START Classpath --");
        while (tokenizer.hasMoreTokens()) {
            System.out.println(tokenizer.nextToken());
        }
        System.out.println("-- END Classpath --");
        EJB3StandaloneBootstrap.boot(null);
        EJB3StandaloneBootstrap.deployXmlResource("security-beans.xml");
        EJB3StandaloneBootstrap.scanClasspath("certitools-ejb.jar");
    }

    protected static void shutdownEmbeddedJboss() {
        EJB3StandaloneBootstrap.shutdown();
    }

    protected static InitialContext getInitialContext() throws Exception {
        Hashtable props = getInitialContextProperties();
        return new InitialContext(props);
    }

    private static Hashtable getInitialContextProperties() {
        Hashtable<String, String> props = new Hashtable<String, String>();
        props.put("java.naming.factory.initial", "org.jnp.interfaces.LocalOnlyContextFactory");
        props.put("java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces");
        props.put(Context.SECURITY_PRINCIPAL, "test");
        props.put(Context.SECURITY_CREDENTIALS, "test");
        props.put(Context.INITIAL_CONTEXT_FACTORY, "org.jboss.security.jndi.JndiLoginInitialContextFactory");
        return props;
    }
}
