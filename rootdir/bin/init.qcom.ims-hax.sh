#!/vendor/bin/sh
#
# HAX for IMS in P
if [ -f /data/system/users/0/settings_global.xml ]; then
    sed -i 's/"multi_sim_data_call" value="1"/"multi_sim_data_call" value="-1"/g' /data/system/users/0/settings_global.xml
    restorecon /data/system/users/0/settings_global.xml
fi
