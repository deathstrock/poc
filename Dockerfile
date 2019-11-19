FROM jenkins/jnlp-slave:3.27-1
ENV DOCKER_VERSION=17.04.0-ce DOCKER_COMPOSE_VERSION=1.14.0 KUBECTL_VERSION=v1.6.6
USER root
RUn apt update -y
RUN apt install -y sudo
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz  \
	&& tar --strip-components=1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/local/bin  \
	&& chmod -R +x /usr/local/bin/docker
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir /etc/docker
RUN touch /etc/docker/default
RUN chmod 777 /etc/docker/default
RUN groupadd docker
RUN usermod -aG docker jenkins
ENTRYPOINT ["jenkins-slave"]

