# kloudlite-platform

[kloudlite-platform](https://github.com/kloudlite.io/helm-charts/charts/kloudlite-platform) Helm Chart for installing and setting up kloudlite platform on your own hosted Kubernetes clusters.

![Version: 1.0.5-nightly](https://img.shields.io/badge/Version-1.0.5--nightly-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.5-nightly](https://img.shields.io/badge/AppVersion-1.0.5--nightly-informational?style=flat-square)

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | grafana | 9.0.1 |
| https://charts.bitnami.com/bitnami | kube-prometheus | 8.15.1 |
| https://charts.jetstack.io | cert-manager | v1.11.0 |
| https://charts.vectorized.io | redpanda-operator | 22.1.6 |
| https://grafana.github.io/helm-charts | loki | 5.8.9 |
| https://helm.vector.dev | vector | 0.23.0 |
| https://kubernetes.github.io/ingress-nginx | ingress-nginx | 4.6.0 |

## Get Repo Info

```console
helm repo add kloudlite https://kloudlite.github.io/helm-charts
helm repo update
```

## Install Chart

**Important:** only helm3 is supported</br>
**Important:** [kloudlite-operators](../kloudlite-operators) must be installed beforehand</br>
**Important:** ensure kloudlite CRDs have been installed</br>

```console
helm install [RELEASE_NAME] kloudlite/kloudlite-platform --namespace [NAMESPACE] [--create-namespace]
```

The command deploys kloudlite-agent on the Kubernetes cluster in the default configuration.

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Installing Nightly Releases

To list all nightly versions (**NOTE**: nightly versions are suffixed by `-nightly`)

```console
helm search repo kloudlite/kloudlite-platform --devel
```

To install
```console
helm install [RELEASE_NAME] kloudlite/kloudlite-platform --version [NIGHTLY_VERSION] --namespace [NAMESPACE] --create-namespace
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME] -n [NAMESPACE]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] kloudlite/kloudlite-platform --install --namespace [NAMESPACE]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values kloudlite/kloudlite-platform
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apps.accountsWeb.image | string | `"ghcr.io/kloudlite/platform/web/accounts-web:v1.0.5-nightly"` | image (with tag) for accounts web |
| apps.auditLoggingWorker.image | string | `"ghcr.io/kloudlite/platform/apis/audit-logging-worker:v1.0.5-nightly"` | image (with tag) for audit logging worker |
| apps.authApi.configuration.oAuth2.enabled | bool | `false` | whether to enable oAuth2 |
| apps.authApi.configuration.oAuth2.github.appId | string | `"<github-app-id>"` | github app Id |
| apps.authApi.configuration.oAuth2.github.appPrivateKey | string | `"PGdpdGh1Yi1hcHAtcHJpdmF0ZS1rZXk+"` | github app private key (base64 encoded) |
| apps.authApi.configuration.oAuth2.github.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/github"` | github oAuth2 callback url |
| apps.authApi.configuration.oAuth2.github.clientId | string | `"<github-client-id>"` | github oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.github.clientSecret | string | `"<github-client-secret>"` | github oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.github.enabled | bool | `false` | whether to enable github oAuth2 |
| apps.authApi.configuration.oAuth2.github.githubAppName | string | `"kloudlite-dev"` | github app name, that we want to install on user's github account |
| apps.authApi.configuration.oAuth2.gitlab.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/gitlab"` | gitlab oAuth2 callback url |
| apps.authApi.configuration.oAuth2.gitlab.clientId | string | `"<gitlab-client-id>"` | gitlab oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.gitlab.clientSecret | string | `"<gitlab-client-secret>"` | gitlab oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.gitlab.enabled | bool | `false` | whether to enable gitlab oAuth2 |
| apps.authApi.configuration.oAuth2.google.callbackUrl | string | `"https://auth.platform.kloudlite.io/oauth2/callback/google"` | google oAuth2 callback url |
| apps.authApi.configuration.oAuth2.google.clientId | string | `"<google-client-id>"` | google oAuth2 Client ID |
| apps.authApi.configuration.oAuth2.google.clientSecret | string | `"<google-client-secret>"` | google oAuth2 Client Secret |
| apps.authApi.configuration.oAuth2.google.enabled | bool | `false` | whether to enable google oAuth2 |
| apps.authApi.image | string | `"ghcr.io/kloudlite/platform/apis/auth:v1.0.5-nightly"` | image (with tag) for auth api |
| apps.authWeb.image | string | `"ghcr.io/kloudlite/platform/web/accounts-web:v1.0.5-nightly"` | image (with tag) for auth web |
| apps.commsApi.configuration | object | `{"sendgridApiKey":"<sendgrid-api-key>","supportEmail":"<support-email>"}` | configurations for comms api |
| apps.commsApi.configuration.sendgridApiKey | string | `"<sendgrid-api-key>"` | sendgrid api key for email communications, if (sendgrid.enabled) |
| apps.commsApi.configuration.supportEmail | string | `"<support-email>"` | email through which we should be sending emails to target users, if (sendgrid.enabled) |
| apps.commsApi.enabled | bool | `true` | whether to enable communications api |
| apps.commsApi.image | string | `"ghcr.io/kloudlite/platform/apis/comms:v1.0.5-nightly"` | image (with tag) for comms api |
| apps.consoleApi.configuration | object | `{}` |  |
| apps.consoleApi.image | string | `"ghcr.io/kloudlite/platform/apis/console:v1.0.5-nightly"` | image (with tag) for console api |
| apps.consoleWeb.image | string | `"ghcr.io/kloudlite/platform/web/console-web:v1.0.5-nightly"` | image (with tag) for console web |
| apps.containerRegistryApi.configuration.harbor | object | `{"adminPassword":"<harbor-admin-password>","adminUsername":"<harbor-admin-username>","apiVersion":"v2.0","imageRegistryHost":"<harbor-registry-host>","webhookAuthz":"<harbor-webhook-authz>","webhookEndpoint":"https://webhooks.platform.kloudlite.io/harbor","webhookName":"kloudlite-dev-webhook"}` | harbor configuration, required only if .apps.containerRegistryApi.enabled  |
| apps.containerRegistryApi.configuration.harbor.adminPassword | string | `"<harbor-admin-password>"` | harbor api admin password |
| apps.containerRegistryApi.configuration.harbor.adminUsername | string | `"<harbor-admin-username>"` | harbor api admin username |
| apps.containerRegistryApi.configuration.harbor.apiVersion | string | `"v2.0"` | harbor api version |
| apps.containerRegistryApi.configuration.harbor.imageRegistryHost | string | `"<harbor-registry-host>"` | harbor image registry host |
| apps.containerRegistryApi.configuration.harbor.webhookAuthz | string | `"<harbor-webhook-authz>"` | harbor webhook authz secret |
| apps.containerRegistryApi.configuration.harbor.webhookEndpoint | string | `"https://webhooks.platform.kloudlite.io/harbor"` | harbor webhook endpoint, (for receiving webhooks for every images pushed) |
| apps.containerRegistryApi.configuration.harbor.webhookName | string | `"kloudlite-dev-webhook"` | harbor webhook name |
| apps.containerRegistryApi.enabled | bool | `false` |  |
| apps.containerRegistryApi.image | string | `"ghcr.io/kloudlite/platform/apis/container-registry:v1.0.5-nightly"` | image (with tag) for container registry api |
| apps.dnsApi.configuration | object | `{"dnsNames":["ns1.platform.kloudlite.io"],"edgeCNAME":"edge.platform.kloudlite.io"}` | configurations for dns api |
| apps.dnsApi.configuration.dnsNames | list | `["ns1.platform.kloudlite.io"]` | list of all dnsNames for which, you want wildcard certificate to be issued for |
| apps.dnsApi.configuration.edgeCNAME | string | `"edge.platform.kloudlite.io"` | base domain for CNAME for all the edges managed (or, to be managed) by this cluster |
| apps.dnsApi.enabled | bool | `false` |  |
| apps.dnsApi.image | string | `"ghcr.io/kloudlite/platform/apis/dns-api:v1.0.5-nightly"` | image (with tag) for dns api |
| apps.financeApi.image | string | `"ghcr.io/kloudlite/platform/apis/finance:v1.0.5-nightly"` | image (with tag) for finance api |
| apps.gatewayApi.image | string | `"ghcr.io/kloudlite/platform/apis/gateway:v1.0.5-nightly"` | image (with tag) for container registry api |
| apps.iamApi.configuration | object | `{}` |  |
| apps.iamApi.image | string | `"ghcr.io/kloudlite/platform/apis/iam:v1.0.5-nightly"` | image (with tag) for iam api |
| apps.infraApi.image | string | `"ghcr.io/kloudlite/platform/apis/infra:v1.0.5-nightly"` | image (with tag) for infra api |
| apps.messageOfficeApi.configuration.tokenHashingSecret | string | `"<token-hashing-secret>"` | consider using 128 chars random string, you can use `python -c "import secrets; print(secrets.token_urlsafe(128))"` |
| apps.messageOfficeApi.image | string | `"ghcr.io/kloudlite/platform/apis/message-office:v1.0.5-nightly"` | image (with tag) for message office api |
| apps.socketWeb.image | string | `"ghcr.io/kloudlite/platform/web/socket-web:v1.0.5-nightly"` | image (with tag) for socket web |
| apps.webhooksApi.configuration.webhookAuthz.githubSecret | string | `"<webhook-authz-github-secret>"` | webhook authz secret for github webhooks |
| apps.webhooksApi.configuration.webhookAuthz.gitlabSecret | string | `"<webhook-authz-gitlab-secret>"` | webhook authz secret for gitlab webhooks |
| apps.webhooksApi.configuration.webhookAuthz.harborSecret | string | `"<harbor-webhook-authz>"` | webhook authz secret for harbor webhooks |
| apps.webhooksApi.configuration.webhookAuthz.kloudliteSecret | string | `"<webhook-authz-kloudlite-secret>"` | webhook authz secret for kloudlite internal calls |
| apps.webhooksApi.enabled | bool | `true` |  |
| apps.webhooksApi.image | string | `"ghcr.io/kloudlite/platform/apis/webhooks:v1.0.5-nightly"` | image (with tag) for webhooks api |
| baseDomain | string | `"platform.kloudlite.io"` | base domain for all routers exposed through this cluster |
| cert-manager | object | `{"cainjector":{"podLabels":{},"resources":{"limits":{"cpu":"120m","memory":"200Mi"},"requests":{"cpu":"80m","memory":"200Mi"}}},"install":false,"installCRDs":false,"nodeSelector":{},"podLabels":{},"resources":{"limits":{"cpu":"80m","memory":"120Mi"},"requests":{"cpu":"40m","memory":"120Mi"}},"startupapicheck":{"enabled":false},"tolerations":[],"webhook":{"podLabels":{},"resources":{"limits":{"cpu":"60m","memory":"60Mi"},"requests":{"cpu":"30m","memory":"60Mi"}}}}` | configuration option for cert-manager (https://cert-manager.io/docs/installation/helm/) |
| cert-manager.cainjector.resources | object | `{"limits":{"cpu":"120m","memory":"200Mi"},"requests":{"cpu":"80m","memory":"200Mi"}}` | resource limits for cert-manager cainjector pods |
| cert-manager.cainjector.resources.limits | object | `{"cpu":"120m","memory":"200Mi"}` | resource limits for cert-manager webhook pods |
| cert-manager.cainjector.resources.limits.cpu | string | `"120m"` | cpu limit for cert-manager cainjector pods |
| cert-manager.cainjector.resources.limits.memory | string | `"200Mi"` | memory limit for cert-manager cainjector pods |
| cert-manager.cainjector.resources.requests.cpu | string | `"80m"` | cpu requests for cert-manager cainjector pods |
| cert-manager.cainjector.resources.requests.memory | string | `"200Mi"` | memory requests for cert-manager cainjector pods |
| cert-manager.install | bool | `false` | whether to install cert-manager |
| cert-manager.installCRDs | bool | `false` | cert-manager whether to install CRDs |
| cert-manager.resources.limits | object | `{"cpu":"80m","memory":"120Mi"}` | resource limits for cert-manager controller pods |
| cert-manager.resources.limits.cpu | string | `"80m"` | cpu limit for cert-manager controller pods |
| cert-manager.resources.limits.memory | string | `"120Mi"` | memory limit for cert-manager controller pods |
| cert-manager.resources.requests.cpu | string | `"40m"` | cpu request for cert-manager controller pods |
| cert-manager.resources.requests.memory | string | `"120Mi"` | memory request for cert-manager controller pods |
| cert-manager.startupapicheck.enabled | bool | `false` | whether to enable startupapicheck, disabling it by default as it unnecessarily increases chart installation time |
| cert-manager.webhook.resources | object | `{"limits":{"cpu":"60m","memory":"60Mi"},"requests":{"cpu":"30m","memory":"60Mi"}}` | resource limits for cert-manager webhook pods |
| cert-manager.webhook.resources.limits | object | `{"cpu":"60m","memory":"60Mi"}` | resource limits for cert-manager webhook pods |
| cert-manager.webhook.resources.limits.cpu | string | `"60m"` | cpu limit for cert-manager webhook pods |
| cert-manager.webhook.resources.limits.memory | string | `"60Mi"` | memory limit for cert-manager webhook pods |
| cert-manager.webhook.resources.requests.cpu | string | `"30m"` | cpu limit for cert-manager webhook pods |
| cert-manager.webhook.resources.requests.memory | string | `"60Mi"` | memory limit for cert-manager webhook pods |
| cloudflareWildCardCert.cloudflareCreds | object | `{"email":"<cloudflare-email>","secretToken":"<cloudflare-secret-token>"}` | cloudflare authz credentials |
| cloudflareWildCardCert.cloudflareCreds.email | string | `"<cloudflare-email>"` | cloudflare authorized email |
| cloudflareWildCardCert.cloudflareCreds.secretToken | string | `"<cloudflare-secret-token>"` | cloudflare authorized secret token |
| cloudflareWildCardCert.create | bool | `true` |  |
| cloudflareWildCardCert.domains | list | `["*.platform.kloudlite.io"]` | list of all SANs (Subject Alternative Names) for which wildcard certs should be created |
| cloudflareWildCardCert.name | string | `"kl-cert-wildcard"` | name for wildcard cert |
| cloudflareWildCardCert.secretName | string | `"kl-cert-wildcard-tls"` | k8s secret where wildcard cert should be stored |
| clusterIssuer.acmeEmail | string | `"sample@example.com"` | email that should be used for communicating with letsencrypt services |
| clusterIssuer.create | bool | `true` | whether to install cluster issuer |
| clusterIssuer.name | string | `"cluster-issuer"` | name of cluster issuer, to be used for issuing wildcard cert |
| clusterSvcAccount | string | `"kloudlite-cluster-svc-account"` | service account for privileged k8s operations, like creating namespaces, apps, routers etc. |
| cookieDomain | string | `".platform.kloudlite.io"` | cookie domain dictates at what domain, the cookies should be set for auth or other purposes |
| defaultProjectWorkspaceName | string | `"default"` | default project workspace name, that should be auto created, whenever you create a project |
| grafana | object | `{"fullnameOverride":"grafana","global":{"storageClass":"<storage-class-name>"},"install":false,"nameOverride":"grafana","persistence":{"enabled":true,"size":"2Gi"}}` | grafana configuration, read more at https://github.com/bitnami/charts/blob/main/bitnami/grafana/values.yaml |
| imagePullPolicy | string | `"Always"` | image pull policies for kloudlite pods, belonging to this chartvalues |
| ingress-nginx | object | `{"controller":{"admissionWebhooks":{"enabled":false,"failurePolicy":"Ignore"},"electionID":"ingress-nginx","extraArgs":{"default-ssl-certificate":"kl-core/kl-cert-wildcard-tls"},"ingressClass":"ingress-nginx","ingressClassByName":true,"ingressClassResource":{"controllerValue":"k8s.io/ingress-nginx","enabled":true,"name":"ingress-nginx"},"kind":"Deployment","podLabels":{},"resources":{"requests":{"cpu":"100m","memory":"200Mi"}},"service":{"type":"LoadBalancer"},"watchIngressWithoutClass":false},"install":false,"nameOverride":"ingress-nginx","rbac":{"create":false},"serviceAccount":{"create":false,"name":"kloudlite-cluster-svc-account"}}` | ingress nginx configurations, read more at https://kubernetes.github.io/ingress-nginx/ |
| ingress-nginx.controller.extraArgs | object | `{"default-ssl-certificate":"kl-core/kl-cert-wildcard-tls"}` | ingress nginx controller extra args true |
| ingress-nginx.controller.kind | string | `"Deployment"` | ingress nginx controller configuration |
| ingress-nginx.install | bool | `false` | whether to install ingress-nginx |
| ingressClassName | string | `"ingress-nginx"` | ingress class name that should be used for all the ingresses, created by this chart |
| kafka.consumerGroupId | string | `"control-plane"` | consumer group ID for kafka consumers running with this helm chart |
| kafka.topicBYOCClientUpdates | string | `"kl-byoc-client-updates"` | kafka topic for messages where target clusters sends updates for cluster BYOC resource |
| kafka.topicBilling | string | `"kl-billing"` | kafka topic for dispatching billing events |
| kafka.topicErrorOnApply | string | `"kl-error-on-apply"` | kafka topic for messages when agent encounters an error while applying k8s resources |
| kafka.topicEvents | string | `"kl-events"` | kafka topic for dispatching audit log events |
| kafka.topicGitWebhooks | string | `"kl-git-webhooks"` | kafka topic for dispatching git webhook messages |
| kafka.topicHarborWebhooks | string | `"kl-harbor-webhooks"` | kafka topic for dispatching harbor webhook messages |
| kafka.topicInfraStatusUpdates | string | `"kl-infra-updates"` | kafka topic for messages regarding infra resources on target clusters |
| kafka.topicStatusUpdates | string | `"kl-status-updates"` | kafka topic for messages regarding kloudlite resources on target clusters |
| kube-prometheus | object | `{"alertmanager":{"enabled":true,"image":{"digest":"","registry":"docker.io","repository":"bitnami/alertmanager","tag":"0.25.0-debian-11-r65"},"paused":false,"persistence":{"enabled":true,"size":"2Gi"}},"blackboxExporter":{"enabled":false},"coreDns":{"enabled":false},"exporters":{"kube-state-metrics":{"enabled":false},"node-exporter":{"enabled":false}},"fullnameOverride":"kube-prometheus","global":{"storageClass":"<storage-class-name>"},"install":false,"kubeApiServer":{"enabled":false},"kubeControllerManager":{"enabled":false},"kubeProxy":{"enabled":false},"kubeScheduler":{"enabled":false},"kubelet":{"enabled":false},"nameOverride":"kube-prometheus","operator":{"enabled":true,"service":{"kubeletService":{"enabled":false}}},"prometheus":{"additionalScrapeConfigs":{"enabled":true,"internal":{"jobList":[{"job_name":"kubernetes-pods","kubernetes_sd_configs":[{"role":"pod"}],"relabel_configs":[{"action":"keep","regex":true,"source_labels":["__meta_kubernetes_pod_annotation_prometheus_io_scrape"]},{"action":"labelmap","regex":"__meta_kubernetes_pod_label_(.+)"},{"action":"replace","source_labels":["__meta_kubernetes_namespace"],"target_label":"namespace"},{"action":"replace","source_labels":["__meta_kubernetes_pod_name"],"target_label":"pod"}]}]},"type":"internal"},"disableCompaction":false,"enableAdminApi":true,"enabled":true,"image":{"digest":"","registry":"docker.io","repository":"bitnami/prometheus","tag":"2.45.0-debian-11-r2"},"paused":false,"persistence":{"enabled":true,"size":"2Gi"},"retention":"10d","walCompression":false}}` | kube prometheus, read more at https://github.com/bitnami/charts/blob/main/bitnami/kube-prometheus/values.yaml |
| loki.install | bool | `false` |  |
| nodeSelector | object | `{}` |  |
| normalSvcAccount | string | `"kloudlite-svc-account"` | service account for non k8s operations, just for specifying image pull secrets |
| operators.accountOperator | object | `{"enabled":true,"image":"ghcr.io/kloudlite/platform/operator/account:v1.0.5-nightly"}` | kloudlite account operator |
| operators.accountOperator.enabled | bool | `true` | whether to enable account operator |
| operators.accountOperator.image | string | `"ghcr.io/kloudlite/platform/operator/account:v1.0.5-nightly"` | image (with tag) for account operator |
| operators.artifactsHarbor.configuration.harbor.adminPassword | string | `"<harbor-admin-password>"` | harbor api admin password |
| operators.artifactsHarbor.configuration.harbor.adminUsername | string | `"<harbor-admin-username>"` | harbor api admin username |
| operators.artifactsHarbor.configuration.harbor.apiVersion | string | `"v2.0"` | harbor api version |
| operators.artifactsHarbor.configuration.harbor.imageRegistryHost | string | `"<harbor-registry-host>"` | harbor image registry host |
| operators.artifactsHarbor.configuration.harbor.webhookAuthz | string | `"<harbor-webhook-authz>"` | harbor webhook authz secret |
| operators.artifactsHarbor.configuration.harbor.webhookEndpoint | string | `"https://webhooks.platform.kloudlite.io/harbor"` | harbor webhook endpoint, (for receiving webhooks for every images pushed) |
| operators.artifactsHarbor.configuration.harbor.webhookName | string | `"kloudlite-dev-webhook"` | harbor webhook name |
| operators.artifactsHarbor.enabled | bool | `false` | whether to enable artifacts harbor operator |
| operators.artifactsHarbor.image | string | `"ghcr.io/kloudlite/platform/operator/artifacts-harbor:v1.0.5-nightly"` | image (with tag) for artifacts harbor operator |
| operators.byocOperator.enabled | bool | `true` | whether to enable byoc operator |
| operators.byocOperator.image | string | `"ghcr.io/kloudlite/platform/operator/byoc:v1.0.5-nightly"` | image (with tag) for byoc operator |
| persistence.XfsStorageClassName | string | `"<xfs-sc>"` | xfs storage class name |
| persistence.storageClassName | string | `"<storage-class-name>"` | ext4 storage class name |
| podLabels | object | `{}` | podlabels for pods belonging to this release |
| redpanda-operator | object | `{"fullnameOverride":"redpanda-operator","install":false,"nameOverride":"redpanda-operator","resources":{"limits":{"cpu":"60m","memory":"60Mi"},"requests":{"cpu":"40m","memory":"40Mi"}},"webhook":{"enabled":false}}` | redpanda operator configuration, read more at https://vectorized.io/docs/quick-start-kubernetes |
| redpandaCluster | object | `{"create":true,"name":"redpanda","replicas":1,"resources":{"limits":{"cpu":"300m","memory":"400Mi"},"requests":{"cpu":"200m","memory":"200Mi"}},"storage":{"capacity":"2Gi"},"version":"v22.1.6"}` | redpanda cluster configuration, read more at https://vectorized.io/docs/quick-start-kubernetes |
| routers.accountsWeb | object | `{}` |  |
| routers.authWeb | object | `{}` |  |
| routers.consoleWeb | object | `{}` |  |
| routers.dnsApi | object | `{}` |  |
| routers.gatewayApi | object | `{}` |  |
| routers.messageOfficeApi | object | `{}` |  |
| routers.socketWeb | object | `{}` |  |
| routers.webhooksApi.enabled | bool | `true` |  |
| subcharts.ingress-nginx.controllerKind | string | `"Deployment"` |  |
| subcharts.ingress-nginx.ingressClassName | string | `"ingress-nginx"` |  |
| subcharts.ingress-nginx.install | bool | `true` |  |
| subcharts.loki-stack.install | bool | `true` |  |
| subcharts.loki-stack.s3credentials.awsAccessKeyId | string | `"<loki-s3-aws-access-key-id>"` |  |
| subcharts.loki-stack.s3credentials.awsSecretAccessKey | string | `"<loki-s3-aws-secret-access-key>"` |  |
| subcharts.loki-stack.s3credentials.bucketName | string | `"<loki-s3-bucket-name>"` |  |
| subcharts.loki-stack.s3credentials.region | string | `"<loki-s3-bucket-region>"` |  |
| tolerations | list | `[]` | tolerations for pods belonging to this release |
| vector | object | `{"customConfig":{"api":{"address":"127.0.0.1:8686","enabled":true,"playground":false},"data_dir":"/vector-data-dir","sinks":{"loki":{"encoding":{"codec":"logfmt"},"endpoint":"http://loki.helm-loki:3100","inputs":["vector"],"labels":{"kl_app":"{{ kubernetes.pod_labels.app }}","source":"vector"},"type":"loki"},"prom_exporter":{"address":"0.0.0.0:9090","flush_period_secs":20,"inputs":["vector"],"type":"prometheus_exporter"},"stdout":{"encoding":{"codec":"json"},"inputs":["vector"],"type":"console"}},"sources":{"vector":{"address":"0.0.0.0:6000","type":"vector","version":"2"}}},"install":false,"podAnnotations":{"prometheus.io/scrape":"true"},"replicas":1,"role":"Stateless-Aggregator"}` | vector configuration, read more at https://vector.dev/docs/setup/installation/package-managers/helm/ |
| vector.install | bool | `false` | vector will be installed with aggregator role |
