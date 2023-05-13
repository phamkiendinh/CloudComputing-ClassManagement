# #!/bin/bash

# # Set the order of resources to be deleted
# resources=("deployments" "svc" "pods" "nodes")

# # Delete resources in the specified order
# for res in "${resources[@]}"
# do
#   kubectl delete $res --all=true -A=true
# done

#!/bin/bash
bash -x destroy_k8s.sh &
bash -x destroy_tf.sh