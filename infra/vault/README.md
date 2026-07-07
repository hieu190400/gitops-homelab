If all the nodes end up in standby, you can recover the cluster as follows.

> **Note:** This procedure assumes you are recovering an integrated Raft storage cluster. It rebuilds the cluster from the leader, so only delete the PVCs of the two replica nodes. **Do not delete the leader's PVC**, as deleting a PVC will erase that node's local Raft data.

1. Exec into the leader node (for example, `vault-0`):

```sh
kubectl exec -it vault-0 -n vault -- sh
```

2. Create a `peers.json` file for recovery:

```sh
cat >/vault/data/raft/peers.json <<'EOF'
[
  {
    "id": "vault-0",
    "address": "vault-0.vault-internal:8201",
    "non_voter": false
  }
]
EOF
```

3. Restart the leader node. It should come back as the active leader.

4. Delete the PVCs of the **two replica nodes only** (for example, `vault-1` and `vault-2`). After deleting each PVC, also delete its corresponding Pod. Otherwise, PVCs will not delete and still in-progress. 
