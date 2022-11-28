FROM ubuntu as lvl_1
RUN useradd -m newuser && passwd -d newuser

FROM openjdk:8-jdk-alpine
COPY --from=lvl_1 /etc/passwd /etc/passwd
COPY ./my-app/target/my-app-* /target/
RUN chown newuser /target/my-app-*
USER newuser
CMD java -jar /target/my-app-*

