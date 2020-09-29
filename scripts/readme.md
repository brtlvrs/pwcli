# pwcli - scripts

When you build the docker image using install.sh from the github repository the script wrapper is automaticly installed in /usr/local/bin.
But when you download the docker image from dockerhub... well it is not.
Bot don't fear....
The content of this folder is also placed inside the image in the folder /2installonhost
The only thing you need to do is to copy the script out of a temporary docker container into your /usr/local/bin (or just copy the content of the script into a new file in /usr/local/bin) and give it the executable bit.

## copy to /usr/local/bin

|step|Action|comment|
|---|---|---|
|1|pull this docker image<br> ```docker pull brtlvrs/pwcli:v0.1```
|2|create temporary container<br>```docker create --name test brtlvrs/pwcli:v0.1```
|3|copy files<br>```docker cp test:/2installonhost/pwsh /usr/local/bin```
|4|make it executable<br>```chmod +x /usr/local/bin/pwsh```
|5|remove docker container<br>```docker rm test```
|6|Tag image to be used in script<br>```docker image tag brtlvrs/pwcli:v0.1 pwcli:latest```