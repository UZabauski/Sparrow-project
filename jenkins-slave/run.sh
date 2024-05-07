#!/bin/bash -e

SWARM_ARGS="-retry 10 -url http://jenkins-master:8080/ -username ${JENKINS_SLAVE_ID} -password ${JENKINS_SLAVE_PASSWORD} -executors 3 -name jenkins-slave"
exec java -jar /usr/share/jenkins/swarm-client-"${SWARM_CLIENT_VERSION}".jar -fsroot /var/jenkins_home ${SWARM_ARGS}
