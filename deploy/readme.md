# pwcli / deploy

## deploy.sh

This is the deployment script for deploying the pwcli container in docker.

## preriquisites

- docker engine

## usage

To run the deployment run

``` #!\bin\bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/brtlvrs/pwcli/v12.2/deploy/deploy.sh)"
```

Of course you could use wget instead of curl.<br>
The script will create an executable file in /usr/local/bin called pwcli<br>
This wrapper will execute a `docker run -it -rm -v <volumes> brtlivrs\pwcli:latest pwsh` command.
Giving you a powershellCore environment. the folder from which you run pwcli is mounted under /pwsh. This is the working directory of the container.

It mounts the following volumes / files:

- ~/.ssh/id_rsa to /root/.ssh/id_rsa
- ˜/.ssh/id_rsa.pub to /root.ssh/id_rsa.pub
- $(pwd) to /pwsh
