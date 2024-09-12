
helm repo add ory https://k8s.ory.sh/helm/charts
helm install my-kratos ory/kratos -n kratos --create-namespace --version 0.47.0