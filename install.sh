!#/bin/sh

apt update && apt upgrade -y && apt dist-upgrade -y

apt install python3-venv git python3-dev libffi-dev gcc libssl-dev python3-docker -y
