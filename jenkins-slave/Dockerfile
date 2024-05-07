FROM jenkins/jenkins:2.456-jdk21
LABEL maintainer='uzabauski@gmail.com'

USER root

RUN apt-get upgrade && \
    apt-get update && \
    apt-get install -qqy jq \
            apt-transport-https \
            curl \
            ca-certificates && \
    apt-get clean

ENV SWARM_CLIENT_VERSION 3.44
ADD https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar \
    /usr/share/jenkins/swarm-client-${SWARM_CLIENT_VERSION}.jar
RUN chmod 644 /usr/share/jenkins/swarm-client-${SWARM_CLIENT_VERSION}.jar

## Installing Docker
# Add Docker's official GPG key:
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -qqy \
            docker-ce \
            docker-ce-cli \
            containerd.io \
            docker-buildx-plugin \
            docker-compose-plugin && \
    apt-get clean

RUN usermod -aG docker jenkins

RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

ENV JENKINS_SLAVE_ID=slave
ENV JENKINS_SLAVE_PASSWORD=slave

COPY --chmod=+x ./run.sh /run.sh

USER jenkins

ENTRYPOINT ["/run.sh"]
