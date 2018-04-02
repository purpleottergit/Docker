#spin up a basic apache
FROM httpd
COPY ./public-html/ /usr/local/apache2/htdocs/
EXPOSE 80
