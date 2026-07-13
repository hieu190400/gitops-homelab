path "kv/data/minio" {
  capabilities = ["read"]
}

path "kv/data/minio/*" {
  capabilities = ["read"]
}

path "kv/metadata/minio" {
  capabilities = ["read", "list"]
}

path "kv/data/mongo" {
  capabilities = ["read"]
}

path "kv/metadata/mongo" {
  capabilities = ["read", "list"]
}