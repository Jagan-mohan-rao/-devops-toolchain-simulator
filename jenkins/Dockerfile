
FROM jenkins/jenkins:lts-jdk21

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

# Install required Jenkins plugins
RUN jenkins-plugin-cli --plugins \
    workflow-aggregator \
    git \
    docker-workflow
