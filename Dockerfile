FROM vmware/powerclicore
  
LABEL author="brtlvrs"

#-- Configure PowerCLI and clear powershell history
RUN pwsh -c "Set-PowerCLIConfiguration -ParticipateInCeip:\$false -DefaultVIServerMode Single -InvalidCertificateAction Ignore -scope AllUsers -confirm:\$false"

#-- create workingdir, this is the path that the wrapper script mounts ${pwd} to
RUN mkdir /pwsh \
 && pwsh -c "clear-history"

WORKDIR /pwsh