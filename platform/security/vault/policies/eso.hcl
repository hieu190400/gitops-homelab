path "kv/data/minio" {
  capabilities = ["read"]
}

path "kv/data/minio/*" {
  capabilities = ["read"]
}

path "kv/metadata/minio/*" {
  capabilities = ["read", "list"]
}