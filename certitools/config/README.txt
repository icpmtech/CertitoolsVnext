In development targets (dev):
Delete: \jboss-4.2.3.GA\server\default\lib\cglib.jar 
(it's already included in the distribution)


Where to copy the config files?

1) certitools-ds.xml
	\jboss-4.2.3.GA\server\default\deploy

2) jackrabbit-jca-1.5.5.rar
	\jboss-4.2.3.GA\server\default\deploy

3) jcr-ds.xml (needs to be edited)
	\jboss-4.2.3.GA\server\default\deploy

4) postgresql-8.3-603.jdbc4.jar
	\jboss-4.2.3.GA\server\default\lib

5) login-config.xml
	\jboss-4.2.3.GA\server\default\conf

6) jcr-1.0.jar
	\jboss-4.2.3.GA\server\default\lib

7) server.xml (edit to allow incoming connections and port 80)
  \jboss-4.2.3.GA\server\default\deploy\jboss-web.deployer

8) run.conf
  \jboss-4.2.3.GA\bin


## Folder jackrabbit
	
1) repository.xml
  Repository folder (edit jcr-ds.xml accordingly)
  
2) index.xml  
  Repository folder (next to repository.xml)
  

## Mail service

1) mail-service.xml (needs to be edited)
	\jboss-4.2.3.GA\server\default\deploy
	

## License
1) Adjust configuration "certitools.licensefiledirectory" to the path of license.properties
2) Aspose.Words.lic - adjust "certitools.asposelicensefile" to the path of Aspose.Words.lic

## linux configurations
jackrabbit folder owner must be jboss

