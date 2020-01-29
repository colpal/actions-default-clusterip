FROM gcr.io/cloud-builders/kubectl

LABEL name="build_clusterip"
LABEL version="1.0.0"
LABEL com.github.actions.name="ClusterIP builder"
LABEL com.github.actions.description="GitHub action to build default ClusterIP svc"
LABEL com.github.actions.color="green"
LABEL com.github.actions.icon="cloud"

COPY . /setup
WORKDIR /setup
RUN chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]