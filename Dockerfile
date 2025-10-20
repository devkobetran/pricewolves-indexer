# Build stage
FROM gradle:8.5-jdk21-alpine AS build
WORKDIR /home/gradle/src
COPY . .
RUN gradle clean build -x test

# Runtime stage
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/pricewolves-indexer-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
