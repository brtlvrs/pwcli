
# pwcli

|pwsh  7.3.4 | pwcli  13.1 | OS  Ubuntu 22.04.2 LTS | [MIT license](LICENSE)|Copyright (c) 2023 Bart Lievers|[blog](https://vblog.bartlievers.nl)|[github](https://github.com/brtlvrs/)|[dockerhub](https://hub.docker.com/r/brtlvrs/)|
|---|---|---|---|---|---|---|---|

## Summary

pwcli is short for powerCLI. It is a docker image based on microsoft/powershell pre-loaded with VMWare PowerCLI, PowerVRA and PowerNSX.
With pwcli you can run powershellCore in a container.<br> 
The deploy script will create a script wrapper that will run the container interactivly.

The base image is the powercli image from VMware. (vmware/powerCLIcore)

## Usage

When installed you can call powershell by ```pwsh```.
Using only ```pwsh``` wil start a temporary docker containter based on the docker image  in interactive mode. Meaning you'll enter the docker container and the prompt changes to ```PS /pwsh>```
When you see this prompt, the powershell enviroment is loaded and you can run powershell, PowerCLI, PowerNSX and/or PowerVRA commands.
The folder you start in ```/pwsh``` is the path on  the docker host where you called ```pwsh```, it is mounted to ```/pwsh```.
In this way you can keep your powershell scripts on the docker host.
You'll exit the powershell environment by typeing ```exit```
On exit, docker will remove the container.

### running powershell scripts

To run powershell scripts from the docker host you should change to the powershell script location and run ```pwsh <scriptname.ps1>```
For example

```bash
cd ./example
pwsh example.ps1
```

This will result in

```
[root@builder example]# pwsh example.ps1
Hello world
```

(yeah I know, mind blowing code... :-)

## considerations

The powershell code is run inside the docker container, with all the features of powershellCore (and its limitations).
The id_rsa and id_rsa.pub ssh key files from the current user are mounted into the container.

## Inspired by

This image is inspired by Alan Renouf, there was a previous powercli docker image, but I couldn't find it, so I built my own.
Let me know if and how you are going to use this.
