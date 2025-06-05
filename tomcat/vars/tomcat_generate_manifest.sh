#!/bin/bash

# Tomcat URL
# https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.102/
# bin/apache-tomcat-9.0.102.tar.gz

# Ensure script is run from relative directory 
cd "$(dirname "$0")" || {
  echo "Failed to change to script directory"
  exit 1
}

MANIFEST_NAME='manifest.yml'

TOMCAT_VERSIONS=$(curl -s https://archive.apache.org/dist/tomcat/tomcat-9/ \
| grep -oP '(?<=href=")[^"]+' \
| sed 's:/$::' \
| tr -d 'v' \
| grep -P '^\d+\.\d+\.\d+$')

LATEST_VERSION=$(echo "$TOMCAT_VERSIONS" | sort -V | tail -n1)

echo 'tomcat_internal_manifest:' > $MANIFEST_NAME
  echo "  - version: \"latest\"" >> $MANIFEST_NAME 
  echo "    version_number: \"$LATEST_VERSION\"" >> $MANIFEST_NAME
  echo "    tomcat_name: \"apache-tomcat-$LATEST_VERSION\"" >> $MANIFEST_NAME
  echo "    archive_name: \"apache-tomcat-$LATEST_VERSION.tar.gz\"" >> $MANIFEST_NAME
  echo "    public_download_url: \"https://archive.apache.org/dist/tomcat/tomcat-9/v$LATEST_VERSION/bin/apache-tomcat-$LATEST_VERSION.tar.gz\"" >> $MANIFEST_NAME
for i in $TOMCAT_VERSIONS
do
  echo "  - version: \"$i\"" >> $MANIFEST_NAME
  echo "    version_number: \"$i\"" >> $MANIFEST_NAME
  echo "    tomcat_name: \"apache-tomcat-$i\"" >> $MANIFEST_NAME
  echo "    archive_name: \"apache-tomcat-$i.tar.gz\"" >> $MANIFEST_NAME
  echo "    public_download_url: \"https://archive.apache.org/dist/tomcat/tomcat-9/v$i/bin/apache-tomcat-$i.tar.gz\"" >> $MANIFEST_NAME
done




