FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk
WORKDIR /app
COPY --from=Build /app/target/devops-integration.jar /app/
EXPOSE 8080
CMD  ["java","-jar","devops-inegration.jar"]
