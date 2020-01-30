FROM gcr.io/cloud-builders/kubectl

LABEL name="predchem-default-clusterip" \
	  version="1.0.1" \
	  com.github.actions.name="PredChem ClusterIP builder" \
	  com.github.actions.description="GitHub action to build default ClusterIP svc" \
	  com.github.actions.color="green" \
	  com.github.actions.icon="cloud"

COPY . /setup
WORKDIR /setup
RUN chmod +x /setup/run.sh

ENTRYPOINT [ "/setup/run.sh" ]