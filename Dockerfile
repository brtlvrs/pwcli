FROM vmware/powerclicore
  
MAINTAINER "brtlvrs"
#-- Configure PowerCLI and clear powershell history
RUN pwsh -c "Set-PowerCLIConfiguration -ParticipateInCeip:\$false -DefaultVIServerMode Single -InvalidCertificateAction Ignore -scope AllUsers -confirm:\$false"
RUN pwsh -c "clear-history"
#-- create workingdir, this is the path that the wrapper script mounts ${pwd} to
RUN mkdir /pwsh
WORKDIR /pwsh