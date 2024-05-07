FROM jenkins/jenkins:2.456-jdk21
LABEL maintainer='uzabauski@gmail.com'

USER root

VOLUME /var/jenkins_home

RUN apt-get upgrade && \
    apt-get update && \
    apt-get install -qqy \
            apt-transport-https \
            ca-certificates && \
    apt-get clean

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV JENKINS_OPTS --sessionTimeout=60 --sessionEviction=1800

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

ENV JENKINS_ADMIN_ID=admin
ENV JENKINS_ADMIN_PASSWORD=admin

ENV JENKINS_SLAVE_ID=slave
ENV JENKINS_SLAVE_PASSWORD=slave

COPY resources/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY resources/casc.yaml /var/jenkins_home/casc.yaml

USER jenkins
