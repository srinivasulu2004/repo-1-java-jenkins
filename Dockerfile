FROM maven:3.8.5-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/java-web-app-1.0-jar-with-dependencies.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

