FROM adoptopenjdk/openjdk8
RUN useradd -m newuser && passwd -d newuser
COPY /home/runner/work/maven-hello-world/maven-hello-world/my-app/target/*.jar ~/target 
RUN chown newuser ~/target 
WORKDIR ~/target
USER newuser
CMD java -jar target/mvn-example-1.0-SNAPSHOT.jar
