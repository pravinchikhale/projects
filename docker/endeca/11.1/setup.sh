mkdir /usr/local/endeca
cd /src; sh /src/OCmdex6.5.1-Linux64_829811.sh --silent --target /usr/local/
source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini
sleep 30
cd /src; sh /src/OCplatformservices11.1.0-Linux64.bin --silent  --target /usr/local/ < /src/silent.txt
source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini
sleep 30
useradd -p mR06v.wgrRHow endeca
chown -R endeca.endeca /usr/local/endeca
chown -R endeca.endeca /usr/local/endeca/*
su - endeca
source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini
source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini
cd /src/cd/Disk1/install; sh /src/cd/Disk1/install/silent_install.sh /src/cd/Disk1/install/silent_response.rsp ToolsandFrameworks /usr/local/endeca/ToolsandFrameworks admin
sleep 30
logout
sh /home/endeca/oraInventory/orainstRoot.sh
su - endeca
cd /src; sh /src/OCcas11.1.0-Linux64.sh --silent --target /usr/local --endeca_tools_root /usr/local/endeca/ToolsandFrameworks/11.1.0/   --endeca_tools_conf /usr/local/endeca/ToolsandFrameworks/11.1.0/server/workspace/ < CAS_silent.txt
source /usr/local/endeca/MDEX/6.5.1/mdex_setup_sh.ini
source /usr/local/endeca/PlatformServices/workspace/setup/installer_sh.ini
echo "Setup completed successfully"