# pwcli

|branch| concourse | [MIT license](LICENSE)|Copyright (c) 2020 Bart Lievers|[blog](https://vblog.bartlievers.nl)|[github](https://github.com/brtlvrs/)|[dockerhub](https://hub.docker.com/r/brtlvrs/)|
|---|---|---|---|---|---|---|

This branch is used by a Concourse pipeline to build a customized pwclicore image, in the step to add extra configuration  to the Dockerfile.

The original Dockerfile from VMware/PowerCLICore is saved as Dockerfile.org
And the contents of the file 'addon' is added to the end of the Dockerfile, which is used to build the brtlvrs/pwcli dockerhub image.
