cat-lovers-society
==================

Social network created using groovy and grails, mongodb, coffeescript.

Tutorial.

First: 
	For create your first app, you need install Grails JDK.
	<a href="http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.2.1.zip">Grails</a>
	After download, you need set up GRAILS_HOME directory in your enviroment path.
	Open "Start" -> "Computer" ->(right click) "Properties" -> "Advanced Sistem Settings" -> "Enviroment Variables". Click "New",
	and add variables with name "GRAILS_HOME" and value set folder where your extract source.
	Find variable with name "Path", click "edit" and add %GRAILS_HOME%\bin;

	Open Comand Prompt and write grails -version, for check your grails version.

	You need instal and configure MongoDB.
	<a href="http://www.mongodb.org/">http://www.mongodb.org/</a>

Second: 
	If all right, we can create first app on groovy and grails.

Open Comand Prompt and write

		grails> grails create-app [name]
		grails> grails create-pom com.mycompany.groupId
		grails> grails install-plugin mongodb
		grails> grails uninstall-plugin hibernate

You need configure mongoDB for grails

Edit DataSource.groovy to specify connection settings. You can entirely remove the content of this configuration file and replace it with the following, or you can specify different connection settings for each of your environments (dev, test, prod):

		grails { 
		  mongo { 
		    host = “localhost” 
		    port = 27107 
		    username = ”user” 
		    password=”secretpassword” 
		    databaseName = “physicians” 
		  } 
		}

Open BuildConfig.groovy and delete next strings:

	  runtime ":hibernate:$grailsVersion"
	  runtime ":database-migration:1.3.2"

Add:
	
		compile ':mongodb:1.1.0.GA'

And write:

		static mapWith="mongo"

in your domain mongo class

For generate model class write:

	grails> grails create-domain-class [className]

example:

	grails create-domain-class com.mycomp.User


For generate controller for domain class write:

	grails> grails generate-controller [domain className]

example:

	grails generate-controller com.mycomp.User



For generate views for domain class write:

	grails> grails generate-view [domain className]

example:

	grails generate-view com.mycomp.User


Write in Comand Prompt:

		grails>grails run-app

For run your grails application.

cat-lovers-society