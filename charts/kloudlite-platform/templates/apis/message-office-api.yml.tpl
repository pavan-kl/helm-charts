apiVersion: crds.kloudlite.io/v1
kind: App
metadata:
  name: {{.Values.apps.messageOfficeApi.name}}
  namespace: {{.Release.Namespace}}
spec:
  region: {{.Values.region | default ""}}
  {{/* serviceAccount: {{.Values.normalSvcAccount}} */}}
  serviceAccount: {{.Values.clusterSvcAccount}}

  {{ include "node-selector-and-tolerations" . | nindent 2 }}

  services:
    - port: 80
      targetPort: {{.Values.apps.messageOfficeApi.configuration.httpPort}}
      name: http
      type: tcp

    - port: {{.Values.apps.messageOfficeApi.configuration.grpcPort}}
      targetPort: {{.Values.apps.messageOfficeApi.configuration.grpcPort}}
      name: grpc
      type: tcp

  containers:
    - name: main
      image: {{.Values.apps.messageOfficeApi.image}}
      imagePullPolicy: {{.Values.apps.messageOfficeApi.ImagePullPolicy | default .Values.imagePullPolicy }}
      resourceCpu:
        min: "100m"
        max: "150m"
      resourceMemory:
        min: "100Mi"
        max: "150Mi"
      env:
        - key: HTTP_PORT
          value: {{.Values.apps.messageOfficeApi.configuration.httpPort | squote}}

        - key: GRPC_PORT
          value: {{.Values.apps.messageOfficeApi.configuration.grpcPort | squote}}
      
        - key: DB_URI
          type: secret
          refName: "mres-{{.Values.managedResources.messageOfficeDb}}"
          refKey: URI

        - key: DB_NAME
          value: {{.Values.managedResources.messageOfficeDb}}

        - key: AUTH_REDIS_HOSTS
          type: secret
          refName: "mres-{{.Values.managedResources.authRedis}}"
          refKey: HOSTS

        - key: AUTH_REDIS_PASSWORD
          type: secret
          refName: "mres-{{.Values.managedResources.authRedis}}"
          refKey: PASSWORD

        - key: AUTH_REDIS_PREFIX
          type: secret
          refName: "mres-{{.Values.managedResources.authRedis}}"
          refKey: PREFIX

        - key: AUTH_REDIS_USERNAME
          type: secret
          refName: "mres-{{.Values.managedResources.authRedis}}"
          refKey: USERNAME

        - key: KAFKA_TOPIC_STATUS_UPDATES
          value: {{.Values.kafka.topicStatusUpdates}}

        - key: KAFKA_TOPIC_INFRA_UPDATES
          value: {{.Values.kafka.topicInfraStatusUpdates}}

        - key: KAFKA_TOPIC_ERROR_ON_APPLY
          value: {{.Values.kafka.topicErrorOnApply}}

        - key: KAFKA_TOPIC_CLUSTER_UPDATES
          value: {{.Values.kafka.topicClusterUpdates}}

        - key: KAFKA_CONSUMER_GROUP
          value: {{.Values.kafka.consumerGroupId}}

        - key: KAFKA_BROKERS
          type: secret
          refName: "{{.Values.secretNames.redpandaAdminAuthSecret}}"
          refKey: KAFKA_BROKERS

        - key: KAFKA_SASL_USERNAME
          type: secret
          refName: "{{.Values.secretNames.redpandaAdminAuthSecret}}"
          refKey: USERNAME

        - key: KAFKA_SASL_PASSWORD
          type: secret
          refName: "{{.Values.secretNames.redpandaAdminAuthSecret}}"
          refKey: PASSWORD

        - key: VECTOR_GRPC_ADDR
          value: {{printf "%s:6000" (include "vector.name" .) | quote}}

        - key: TOKEN_HASHING_SECRET
          value: {{.Values.apps.messageOfficeApi.configuration.tokenHashingSecret | squote}}

