$namespace = "vault"

$keys = @(
    "KEY_1",
    "KEY_2",
    "KEY_3"
)

$pods = @(
    "vault-0",
    "vault-1",
    "vault-2"
)

foreach ($pod in $pods) {
    Write-Host "==== Unsealing $pod ===="

    foreach ($key in $keys) {
        kubectl exec -i -n $namespace $pod -- vault operator unseal $key
    }

    kubectl exec -n $namespace $pod -- vault status
}