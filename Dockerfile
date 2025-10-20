# Build stage
FROM gradle:9.1-jdk21-alpine AS build
WORKDIR /home/gradle/src
COPY . .
RUN gradle clean build -x test

# Runtime stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/pricewolves-indexer-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
