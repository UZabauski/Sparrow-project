# Jenkins with Grype and Syft
This is a fully configured as a code Jenkins master and slave with [Grype](https://github.com/anchore/grype) and [Syft](https://github.com/anchore/syft) test jobs.
The goal of this project is to be able to integrate vulnerability scanner and software bill of materials (SBOM) generation of Docker images with Jenkins pipeline jobs. Since [Anchore Engine](https://github.com/anchore/anchore-engine) is no longer maintained, **Grype** and **Syft** scanners were used.

## Configuration before start
1. This project is using my own repository of [Dockefile templates](https://github.com/UZabauski/Dockerfiles-templates). This configuration\code can be changed [here](https://github.com/UZabauski/jenkins-grype-syft/blob/main/jenkins-master/resources/casc.yaml#L52);
2. `JENKINS_ADMIN_ID` and `JENKINS_SLAVE_ID` user passwords\names can be configured [here](https://github.com/UZabauski/jenkins-grype-syft/blob/main/jenkins-master/Dockerfile#L21) for **Jenkins master** and [here](https://github.com/UZabauski/jenkins-grype-syft/blob/main/jenkins-slave/Dockerfile#L45) for **Jenkins Slave**.

## Getting started
1. Navigate to the beginning of the repository and run ```docker compose``` commands:
```
docker compose build
docker compose up -d
```
2. Jenkins will be available at http://127.0.0.1:8080/

## References and tips
1. Optional Docker compose commands:
    - ```docker compose down``` - stops, deletes containers, etc;
    - ```docker logs jenkins-master -f``` - follow log output for ```jenkins-master``` docker container;
2. **Jenkins Configuration as Code Reference check** will be located [here](http://127.0.0.1:8080/manage/configuration-as-code/reference), when Jenkins is running.