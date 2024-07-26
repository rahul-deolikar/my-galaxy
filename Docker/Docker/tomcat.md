FROM tomcat:9
EXPOSE 8080
RUN rm -rf /usr/local/tomcat/webapps/ROOT && \
    mv /usr/local/tomcat/webapps.dist/ROOT /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
