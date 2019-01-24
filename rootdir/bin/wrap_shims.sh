#!/sbin/sh

#Hex edit Common libs
sed -i "s|libstagefright.so|lib-imsvt_shim.so|g" /vendor/lib/lib-imsvt.so
restorecon /vendor/lib/lib-imsvt.so

exit 0
