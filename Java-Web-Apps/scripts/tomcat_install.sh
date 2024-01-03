#!/bin/bash

# Define Tomcat version
TOMCAT_VERSION="9.0.52"

# Define installation directory
INSTALL_DIR="/opt"

# Define download URL
DOWNLOAD_URL="https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"

# Download and extract Tomcat
echo "Downloading Apache Tomcat ${TOMCAT_VERSION}..."
wget -qO- ${DOWNLOAD_URL} | tar -xz -C ${INSTALL_DIR}

# Set environment variables
export CATALINA_HOME=${INSTALL_DIR}/apache-tomcat-${TOMCAT_VERSION}
export PATH=${PATH}:${CATALINA_HOME}/bin

# Start Tomcat
echo "Starting Apache Tomcat..."
${CATALINA_HOME}/bin/startup.sh

# Display information
echo ""
echo "Apache Tomcat ${TOMCAT_VERSION} is now running."
echo "Tomcat home: ${CATALINA_HOME}"
echo "Tomcat URL: http://localhost:8080/"
echo "Tomcat manager URL: http://localhost:8080/manager/html/"
echo ""

# Note: Ensure that you have the necessary permissions to write to the chosen installation directory

