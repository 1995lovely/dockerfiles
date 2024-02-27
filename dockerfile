# Use the official CentOS image as the base image
FROM centos:latest

# Install necessary packages (Apache web server)
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all

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
