!#/usr/bin/bash

apt update && apt upgrade -y && apt dist-upgrade -y

apt install python3-venv git python3-dev libffi-dev gcc libssl-dev python3-docker mc net-tools -y

python3 -m venv /path/to/venv
source /path/to/venv/bin/activate

source /path/to/venv/bin/activate && pip install -U pip

source /path/to/venv/bin/activate &&  pip install 'ansible>=4,<6'

source /path/to/venv/bin/activate &&  pip install git+https://opendev.org/openstack/kolla-ansible@stable/zed

mkdir -p /etc/kolla

cp -r  /path/to/venv/share/kolla-ansible/etc_examples/kolla/* /etc/kolla
cp /path/to/venv/share/kolla-ansible/ansible/inventory/all-in-one /etc/kolla

source /path/to/venv/bin/activate && kolla-ansible install-deps

source /path/to/venv/bin/activate && cd /etc/kolla && kolla-genpwd

cd /home/customer/gurindam-cloud && cp -R globals.yml /etc/kolla

cd /etc/kolla && kolla-ansible -i ./all-in-one bootstrap-servers
cd /etc/kolla && kolla-ansible -i ./all-in-one prechecks
cd /etc/kolla && kolla-ansible -i ./all-in-one deploy
source /path/to/venv/bin/activate && pip install python-openstackclient
source /path/to/venv/bin/activate && kolla-ansible post-deploy
