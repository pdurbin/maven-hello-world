# A simple, minimal Maven example: hello world

##### Creating files in the repo

To create the files in this git repo we've already run `mvn archetype:generate` from http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

    mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

<<<<<<< HEAD
##### Printing "Hello World!"

To print "Hello World!", type either

=======
Now, to print "Hello World!", type one of the following below: 
...
>>>>>>> upstream/master
    cd my-app
    mvn compile
    java -cp target/classes com.mycompany.app.App

or...

    cd my-app
    mvn package
    java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

##### Running `mvn clean` will get us back to only the source Java and the `pom.xml`:

    murphy:my-app pdurbin$ mvn clean --quiet
    murphy:my-app pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/mycompany/app/App.java
    src/test/java/com/mycompany/app/AppTest.java

##### Running `mvn compile` produces a class file:

    murphy:my-app pdurbin$ mvn compile --quiet
    murphy:my-app pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/mycompany/app/App.java
    src/test/java/com/mycompany/app/AppTest.java
    target/classes/com/mycompany/app/App.class
    murphy:my-app pdurbin$ 
    murphy:my-app pdurbin$ java -cp target/classes com.mycompany.app.App
    Hello World!

##### Running `mvn package` does a compile and creates the target directory, including a jar:

    murphy:my-app pdurbin$ mvn clean --quiet
    murphy:my-app pdurbin$ mvn package > /dev/null
    murphy:my-app pdurbin$ ack -a -f
    pom.xml
    src/main/java/com/mycompany/app/App.java
    src/test/java/com/mycompany/app/AppTest.java
    target/classes/com/mycompany/app/App.class
    target/maven-archiver/pom.properties
    target/my-app-1.0-SNAPSHOT.jar
    target/surefire-reports/com.mycompany.app.AppTest.txt
    target/surefire-reports/TEST-com.mycompany.app.AppTest.xml
    target/test-classes/com/mycompany/app/AppTest.class
    murphy:my-app pdurbin$ 
    murphy:my-app pdurbin$ java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
    Hello World!

##### Running `mvn clean compile exec:java` requires http://mojo.codehaus.org/exec-maven-plugin/

##### Running `java -jar target/my-app-1.0-SNAPSHOT.jar` requires http://maven.apache.org/plugins/maven-shade-plugin/

### If you need help at any time

<<<<<<< HEAD
##### Running `mvn --help`  will display the maven help menu
=======
Running `mvn --help`  will display the maven help menu

-The emojis for git are amazing! :trollface:

#This is just a test 
BL Taken from http://www.tutorialspoint.com/maven/maven_pom.htm
#POM
POM stands for __Project Object Model__. It is fundamental Unit of Work in Maven. It is an XML file. It always resides in the base directory of the project as pom.xml.

The POM contains information about the project and various configuration detail used by Maven to build the project(s).

POM also contains the goals and plugins. While executing a task or goal, Maven looks for the POM in the current directory. It reads the POM, gets the needed configuration information, then executes the goal. Some of the configuration that can be specified in the POM are following:

* project dependencies

* plugins

* goals

* build profiles

* project version

* developers

* mailing list

Before creating a POM, we should first decide the project __group__ (groupId), its __name__(artifactId) and its __version__ as these attributes help in uniquely identifying the project in repository.

#Example POM:

```XML
<project xmlns="http://maven.apache.org/POM/4.0.0"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
   http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <groupId>com.companyname.project-group</groupId>
   <artifactId>project</artifactId>
   <version>1.0</version>
</project>
```

It should be noted that there should be a single POM file for each project.

* All POM files require the project element and three mandatory fields: 
    * groupId, 
    * artifactId,
    * version.

* Projects notation in repository is groupId:artifactId:version.

* Root element of POM.xml is project and it has three major sub-nodes :

Node | Description
-----|-------------
groupId|This is an Id of project's group. This is generally unique amongst an organization or a project. For example, a banking group com.company.bank has all bank related projects.
artifactId|This is an Id of the project.This is generally name of the project. For example, consumer-banking. Along with the groupId, the artifactId defines the artifact's location within the repository.
version|This is the version of the project.Along with the groupId, It is used within an artifact's repository to separate versions from each other. For example:<br><li> com.company.bank:consumer-banking:1.0</li> <br><li> com.company.bank:consumer-banking:1.1.</li>




>>>>>>> upstream/master
