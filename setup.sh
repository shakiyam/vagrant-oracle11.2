#!/bin/bash
set -eu -o pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"

# Install Oracle Preinstallation RPM
yum -y install oracle-rdbms-server-11gR2-preinstall

# Create directories
mkdir -p /u01/app/
chown -R oracle:oinstall /u01/app/
chmod -R 775 /u01/app/

# Set environment variables
cat <<EOT >> /home/oracle/.bash_profile
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/11.2.0.1/dbhome_1
export ORACLE_SID=orcl11g
export PATH=\$PATH:\$ORACLE_HOME/bin
EOT

# Install rlwrap and set alias
# shellcheck disable=SC1091
readonly OS_VERSION=$(. /etc/os-release; echo "$VERSION")
case ${OS_VERSION%%.*} in
  7)
    yum -y --enablerepo=ol7_developer_EPEL install rlwrap
    cat <<EOT >>/home/oracle/.bashrc
alias sqlplus='rlwrap sqlplus'
EOT
    ;;
esac

# Set oracle password
echo oracle:oracle | chpasswd

# Install database
su - oracle -c "$script_dir/database/runInstaller -silent \
  -ignorePrereq  -waitforcompletion -responseFile $script_dir/db_install.rsp"
/u01/app/oraInventory/orainstRoot.sh
/u01/app/oracle/product/11.2.0.1/dbhome_1/root.sh

# Create listener using netca
su - oracle -c "DISPLAY=0.0 netca -silent -responseFile \
  $script_dir/database/response/netca.rsp"

# Create database
su - oracle -c "dbca -silent -createDatabase -responseFile $script_dir/dbca.rsp"

# Shutdown database
#echo "shutdown immediate" | su - oracle -c 'sqlplus "/ as sysdba"'

# Stop listener
#su - oracle -c "lsnrctl stop"
