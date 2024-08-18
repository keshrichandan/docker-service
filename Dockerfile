FROM openjdk:11

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} dockerservice.jar

ENTRYPOINT ["java","-jar","/dockerservice.jar"]

EXPOSE 8080