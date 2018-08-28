resource "local_file" "kubeconfig" {
  filename = "${ var.kubernetes_config_file }"

  content  = <<-EOF
    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority-data: ${ google_container_cluster.main.master_auth.0.cluster_ca_certificate }
        server: https://${ google_container_cluster.main.endpoint }
      name: kubernetes
    contexts:
    - context:
        cluster: kubernetes
        user: kubernetes
      name: kubernetes
    current-context: kubernetes
    kind: Config
    preferences: {}
    users:
    - name: kubernetes
      user:
        auth-provider:
          config:
            cmd-args: config config-helper --format=json
            cmd-path: gcloud
            expiry-key: '{ .credential.token_expiry }'
            token-key: '{ .credential.access_token }'
          name: gcp
    EOF

  provisioner "local-exec" {
    command = "chmod 640 ${ var.kubernetes_config_file }"
  }
}
