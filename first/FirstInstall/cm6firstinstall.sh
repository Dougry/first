#!/bin/bash

cd /opt
tar -xzf  wildfly12-cm6-linux.tar.gz -C /opt
chmod +x /opt/cm-data/scripts/*.sh

sed -i 's/\r//' /opt/cm-data/scripts/install_wget.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_wget_AltLinux.sh
sed -i 's/\r//' /opt/cm-data/scripts/download_distr.sh
sed -i 's/\r//' /opt/cm-data/scripts/download_distr_AltLinux.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_LO.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_LO_AltLinux.sh
sed -i 's/\r//' /opt/cm-data/scripts/install-wildfly-12.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_jdk.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_jdk_AltLinux.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_postgresql-10.sh
sed -i 's/\r//' /opt/cm-data/scripts/install_postgresql-10_AltLinux.sh
sed -i 's/\r//' /opt/cm-data/scripts/fill_init_folder_with_csvs_from_ear.sh
sed -i 's/\r//' /opt/cm-data/scripts/after_install_steps.sh
sed -i 's/\r//' /opt/cm-data/scripts/full_network_install.sh
sed -i 's/\r//' /opt/cm-data/scripts/full_network_install_AltLinux.sh


#!/bin/bash

OSRelease=`uname -r`
release="unknown"

if [[ $OSRelease == *"el7"* ]]; then
        release="CentOS7"
elif [[ $OSRelease == *"alt"* ]]; then
        release="AltLinux"
fi

echo $release

case $release in 

CentOS7)

		echo "Install on CentOS/RHEL system!"
        
		/opt/cm-data/scripts/full_network_install.sh
		;;
		
AltLinux)
		echo "Install on AltLinux!"
		/opt/cm-data/scripts/full_network_install_AltLinux.sh
		;;
		
*)
        echo "Unknown system. Do nothing"
		;;
esac

rm -f /opt/wildfly12-cm6-linux.tar.gz
sed -i 's/#JAVA_HOME="\/opt\/java\/jdk/JAVA_HOME="\/opt\/java/g' /opt/wildfly/bin/standalone.conf