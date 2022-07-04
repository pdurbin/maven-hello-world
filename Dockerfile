# copies the artifacts to the image and run the .jar file
FROM anapsix/alpine-java:8u202b08
ADD target/my-app-*.jar /home/myjar.jar
CMD ["java","-jar","/home/myjar.jar"]