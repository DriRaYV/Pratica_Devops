FROM maven:3.8.3-openjdk-17 as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /target/JBS-0.1.jar java.jar
EXPOSE 9091
ENTRYPOINT ["java","-jar", "java.jar"]
