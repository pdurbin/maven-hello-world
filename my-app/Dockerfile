# Base Alpine Linux based image with OpenJDK JRE only
FROM openjdk:8-jre-alpine
# copy application jar (with libraries inside)
WORKDIR /app
COPY target/my-app*.jar ./my-app.jar
# specify default command
CMD ["/usr/bin/java", "-jar", "/app/my-app.jar"]
