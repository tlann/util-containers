FROM centos:7.7.1908

USER root

#RUN mkdir -p /deployments

# JAVA_APP_DIR is used by run-java.sh for finding the binaries
#ENV JAVA_APP_DIR=/deployments \
ENV JAVA_MAJOR_VERSION=11


# /dev/urandom is used as random source, which is prefectly safe
# according to http://www.2uo.de/myths-about-urandom/
RUN yum install -y \
       java-11-openjdk-11.0.6.10-3.el7 \ 
    && echo "securerandom.source=file:/dev/urandom" >> /usr/lib/jvm/jre/lib/security/java.security 

RUN yum install -y git openssl emacs postgresql

RUN yum clean all

ENV JAVA_HOME /etc/alternatives/jre

CMD [ "/bin/bash" ]
#CMD [ "/deployments/run-java.sh" ]
