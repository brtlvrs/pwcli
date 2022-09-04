FROM vmware/powerclicore
  
MAINTAINER "brtlvrs"
#--
#RUN tdnf update -y
RUN tdnf install openssh -y
RUN tdnf clean all
#-- Configure PowerCLI and clear powershell history
RUN pwsh -c "Set-PowerCLIConfiguration -ParticipateInCeip:\$false -DefaultVIServerMode Single -InvalidCertificateAction Ignore -scope AllUsers -confirm:\$false"
RUN pwsh -c "clear-history"
#-- create workingdir, this is the path that the wrapper script mounts ${pwd} to
RUN mkdir /pwsh
RUN history -c
WORKDIR /pwsh