# DOCKER-VERSION 0.3.4
FROM    centos:centos6

# Enable EPEL
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# Install libaio
RUN     yum install -y tar which libaio dos2unix

# Bundle app source
ADD . /src
# Install app dependencies
RUN mkdir /usr/local/endeca
RUN cd /src; sh /src/OCmdex6.5.1-Linux64_829811.sh --silent --target /usr/local/
RUN source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini
RUN cd /src; sh /src/OCplatformservices11.1.0-Linux64.bin --silent  --target /usr/local/ < /src/PlatServ_silent.txt
RUN source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini
RUN useradd -p mR06v.wgrRHow endeca
RUN chown -R endeca.endeca /usr/local/endeca
RUN chown -R endeca.endeca /usr/local/endeca/*
RUN chown -R endeca.endeca /src/cd/*
USER endeca
RUN source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini
RUN source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini
USER endeca
RUN chown -R endeca.endeca /usr/local/endeca/* && sh /src/cd/Disk1/install/silent_install.sh /src/cd/Disk1/install/silent_response.rsp ToolsandFrameworks /usr/local/endeca/ToolsandFrameworks admin
USER root
RUN sh /home/endeca/oraInventory/orainstRoot.sh
USER endeca
RUN cd /src; sh /src/OCcas11.1.0-Linux64.sh --silent --target /usr/local --endeca_tools_root /usr/local/endeca/ToolsandFrameworks/11.1.0/   --endeca_tools_conf /usr/local/endeca/ToolsandFrameworks/11.1.0/server/workspace/ < /src/CAS_silent.txt
USER root
RUN echo "Setup completed successfully"

############## NOT TESTED YET #########################
#RUN mkdir /usr/local/endeca/Apps
#RUN sh /usr/local/endeca/ToolsandFrameworks/11.1.0/deployment_template/bin/deploy.sh --app /usr/local/endeca/ToolsandFrameworks/11.1.0/reference/discover-data-cas/deploy.xml
#RUN cd /usr/local/endeca/Apps/Discover/control/
#RUN cd /usr/local/endeca/Apps/Discover/control; sh ./initialize_services.sh
#RUN cd /usr/local/endeca/Apps/Discover/control; sh ./load_baseline_test_data.sh
#RUN cd /usr/local/endeca/Apps/Discover/control; sh ./baseline_update.sh
#RUN cd /usr/local/endeca/Apps/Discover/control; sh ./promote_content.sh
############## NOT TESTED YET #########################



EXPOSE  8006
EXPOSE  8888
#CMD ["node", "/src/app.js"]
