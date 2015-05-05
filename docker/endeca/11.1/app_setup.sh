mkdir Apps
sh /usr/local/endeca/ToolsandFrameworks/11.1.0/deployment_template/bin/deploy.sh --app /usr/local/endeca/ToolsandFrameworks/11.1.0/reference/discover-data-cas/deploy.xml
cd /usr/local/endeca/Apps/Discover/control/
cd /usr/local/endeca/Apps/Discover/control; sh ./initialize_services.sh
cd /usr/local/endeca/Apps/Discover/control; sh ./load_baseline_test_data.sh
cd /usr/local/endeca/Apps/Discover/control; sh ./baseline_update.sh
cd /usr/local/endeca/Apps/Discover/control; sh ./promote_content.sh
