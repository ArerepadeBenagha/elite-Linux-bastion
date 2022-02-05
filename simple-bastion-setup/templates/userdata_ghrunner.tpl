#!/bin/bash -xe
yum update -y
yum install docker -y
yum install git -y
yum install jq -y
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker
export RUNNER_ALLOW_RUNASROOT=true
mkdir actions-runner && cd actions-runner
curl -O -L https://github.com/actions/runner/releases/download/v2.279.0/actions-runner-linux-x64-2.279.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.279.0.tar.gz
PAT=${PAT}
INSTANCEID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo my-runners-$INSTANCEID
token=$(curl -s -XPOST \
-H "authorization: token $PAT" \
https://api.github.com/repos/JimmyDqv/runners-test/actions/runners/registration-token | \
jq -r .token)
sudo chown ec2-user -R /actions-runner
./config.sh --url https://github.com/elitecloud/gitclass --token $token --name "my-runners-$INSTANCEID" --work _work
sudo ./svc.sh install
sudo ./svc.sh start
sudo chown ec2-user -R /actions-runner