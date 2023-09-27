FROM maven:3.8.3-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /target/mudi-0.1-SNAPSHOT.jar java.jar
EXPOSE 9091
ENTRYPOINT ["java","-jar", "java.jar"]
