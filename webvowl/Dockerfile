###########
# WebVOWL #
###########

# Start container
# docker run --rm -d -p 8080:8080 ukparliament/webvowl:latest

# Use tomcat java 8 alpine as base image
FROM tomcat:9-jre8-alpine

# Build time arguments (WebVOWL version)
ARG version=1.1.2

# Download WebVOWL to tomcat webapps directory as root app
RUN rm -rf /usr/local/tomcat/webapps/* && \
    wget -O /usr/local/tomcat/webapps/ROOT.war http://downloads.visualdataweb.de/webvowl_${version}.war

# Run default server
CMD ["catalina.sh", "run"]
