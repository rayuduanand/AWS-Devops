## Step by Step guide to install Apache Tomcat on Amazon Linux ##
### Prerequisites:
* Amazon Linux Machine with a minimum of 1GB RAM. It will be sufficent to do A proof of concept (POC).
* Open Port.No: 8080 in EC2-security group.
### Install Java.
```
sudo su - 
yum install java -y

```
version of java to be installed dependes up on tomcat version: https://tomcat.apache.org/whichversion.html
### Download Tomcat Binary file.
tomcat-10 download page: https://tomcat.apache.org/download-10.cgi
```
# Become a root
sudo su -
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz
# unzip tomcat binary
tar -xvzf apache-tomcat-10.1.9 
# Rename for simplicity 
mv apache-tomcat-10.1.9 tomcat
```
### Create a tomcat user.
its not a good practice to run tomcat using root user.
```
# Become a root,no need to execute this cmd if your already root user.
sudo su -
# create a tomcat user
adduser tomcat
# create a password for tomcat user
passwd tomcat 
# enter the New password then Retype new password, you should see passwd: all authentication tokens updated successfully.
```
### Now change the ownership of /opt/tomcat file from root to tomcat being a root user.
```
# Become a root, no need to execute this cmd if your already root user.
sudo su - 
chown -R tomcat:tomcat /opt/tomcat
```
### Now switch to tomcat user and make following changes.
```
su - tomcat
cd /opt/tomcat
# Create a tomcat user and assign manager-gui, manager-script ,manager-jmx, manager-status roles.
vi conf/tomcat-users.xml
# Add the below line before tomcat-users-tag.
<user username="sampath" password="sampath" roles="manager-gui,manager-script,manager-jmx,manager-status"/>
</tomcat-users>
press Esc
:wq 

# enter the below command in tomcat directory.
find . -name context.xml
# you will see the following lines.
./conf/context.xml
./webapps/docs/META-INF/context.xml
./webapps/examples/META-INF/context.xml
./webapps/host-manager/META-INF/context.xml
./webapps/manager/META-INF/context.xml
#comment value tag sections in below all files
vi ./webapps/examples/META-INF/context.xml
vi ./webapps/host-manager/META-INF/context.xml
vi ./webapps/manager/META-INF/context.xml
```

### In tomcat-10 Execute Permission are already present to catalina.sh, startup.sh & shutdown.sh
if your going with tomcat-9 or others give execute Permission.
```
# Go to bin directory.
cd /opt/tomcat/bin
chmod +x catalina.sh startup.sh  shutdown.sh
```
### Create a link files for Tomcat Server up and Down.
```
ln -s /opt/apache-tomcat-9.0.55/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/apache-tomcat-9.0.55/bin/shutdown.sh /usr/local/bin/tomcatdown
# Now start the tomcat. 
tomcatup
```
### Now access the tomcat by web-browser.
open a new tab and enter
http://Public IPv4 address:8080/


### You can access Server Status, Manager App and Host Manager by entering tomcat username and password.
```
# if you have changed it use what you have used in tomcat-users.xml file.
username="test" 
password="test"

```
