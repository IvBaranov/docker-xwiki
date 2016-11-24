FROM tomcat:8-jre8
MAINTAINER Ivan Baranov <baranov.ivan.v@gmail.com>

# remove tomcat default webapps
RUN rm -rf webapps/*

ENV XWIKI_VERSION 8.4.1
ENV MYSQL_CONNECTOR_J_VERSION 5.1.40

# get xwiki
RUN wget -O /tmp/xwiki.war "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-${XWIKI_VERSION}.war" && \
    unzip /tmp/xwiki.war -d webapps/ROOT && \
    rm /tmp/xwiki.war

# get mysql connector/j
RUN wget -O /tmp/mysql-connector-java.tar.gz "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_J_VERSION}.tar.gz" && \
    tar -xf /tmp/mysql-connector-java.tar.gz --strip-components=1 -C lib && \
    rm /tmp/mysql-connector-java.tar.gz

# configuration due to http://platform.xwiki.org/xwiki/bin/view/AdminGuide/Installation
COPY setenv.sh bin/

# configuration of database
COPY hibernate.cfg.xml webapps/ROOT/WEB-INF