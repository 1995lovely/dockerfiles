# Use the official ubuntu image as the base image
FROM ubuntu:latest
# Install necessary packages (Apache web server)
RUN apt-get update 
RUN apt-get install -y apache2 \
    zip \
  unzip  
RUN apt-get install apache2-utils -y
RUN apt-get clean 
# Get website link from internet and used add command 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html
# create workdirectory 
WORKDIR /var/www/html
# unzip the file
RUN unzip carvilla.zip 
# copy unzip file in the present directory
RUN cp -rvf carvilla-v1.0/* .
# Expose port 80 for web traffic
EXPOSE 80
# Start the Apache web server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
