#!/usr/bin/bash

# simple installer script, to build the ansible image and copy some scripts to /usr/local/bin

docker build -t pwcli:0.1 .
docker tag pwcli:0.1 pwcli:latest
cp ./scripts/pwsh /usr/local/bin/
chmod +x /usr/local/bin/pwsh