FROM gcr.io/cloud-builders/kubectl

LABEL name="predchem-default-clusterip"
LABEL version="1.0.1"
LABEL com.github.actions.name="PredChem ClusterIP builder"
LABEL com.github.actions.description="GitHub action to build default ClusterIP svc"
LABEL com.github.actions.color="green"
LABEL com.github.actions.icon="cloud"

COPY . /setup
WORKDIR /setup
RUN chmod +x /setup/run.sh

ENTRYPOINT [ "/setup/run.sh" ]