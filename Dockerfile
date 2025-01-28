# WARファイルのビルド(java21)
FROM maven:3.9.6-eclipse-temurin-21-jammy AS buildtime-stage
COPY . .
RUN mvn package

# Tomcatによる稼動配備(tomcat10-java21)
FROM tomcat:10.1.20-jre21-temurin-jammy AS runtime-stage
WORKDIR ${CATALINA_HOME}
COPY --from=buildtime-stage target/ROOT.war webapps/ROOT.war

