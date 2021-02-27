ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "apt-get install open-iscsi -y"
ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "cat /etc/iscsi/initiatorname.iscsi"
ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "cat systemctl enable --now iscsid"
ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "systemctl enable --now iscsid"

kubectl create ns openebs

helm repo add openebs https://openebs.github.io/charts
helm repo update

helm upgrade -i openebs -n openebs openebs/openebs -f openebs/values.yaml

