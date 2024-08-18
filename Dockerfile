# Stage 1: Build the JAR file
FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create the Docker image
FROM eclipse-temurin:17-jre
COPY --from=build /app/target/*.jar dockerservice.jar

ENTRYPOINT ["java", "-jar", "/dockerservice.jar"]

EXPOSE 8080