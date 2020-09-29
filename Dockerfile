FROM microsoft/powershell
  
MAINTAINER "brtlvrs"

# trust PSGallery (so we can install modules)
RUN pwsh -c "\$ProgressPreference=SilentlyContinue; set-PSRepository -NAme PSGallery -InstallationPolicy trusted"

#-- install VMware PowerCLI module
RUN export script="install-Module VMware.PowerCLI -AcceptLicense -Confirm:\$false" \
    && pwsh -c "$script" \
    && unset script

#-- install PowerNSX module
RUN export script="install-Module PowerNSX -AcceptLicense -Confirm:\$false" \   
    && pwsh -c "$script" \
    && unset script

#-- install PowerVRA module
RUN export script="install-Module PowerVRA -AcceptLicense -Confirm:\$false" \    
    && pwsh -c "$script" \
    && unset script

#-- Configure PowerCLI and clear powershell history
RUN pwsh -c "Set-PowerCLIConfiguration -ParticipateInCeip:\$false -DefaultVIServerMode Single -InvalidCertificateAction Ignore -scope AllUsers -confirm:\$false"
RUN pwsh -c "clear-history"


RUN mkdir -p /2installonhost
COPY scripts/* /2installonhost

RUN   find / -name "net45" | xargs rm -rf
ENV PATH=${PATH}:/pwsh

#-- create workingdir, this is the path that the wrapper script mounts ${pwd} to
RUN mkdir /pwsh
WORKDIR /pwsh