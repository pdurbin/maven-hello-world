FROM openjdk:8
RUN useradd -m user && passwd -d user
COPY ./my-app/target/m* ~/target/
USER user
CMD java -jar *.jar; sleep 1000000
