FROM kalilinux/kali-rolling:latest

EXPOSE 9001 9002 9003 9004 9005 9006 9007 9008 9009 9010

# Install base stuff
RUN apt -y update \
    && apt -y install metasploit-framework vim mlocate exploitdb

# In docker, there's no systemctl, so a sed is necessary
RUN sed 's/systemctl start ${PG_SERVICE}/service ${PG_SERVICE} start/g;s/systemctl status ${PG_SERVICE}/service ${PG_SERVICE} status/g;s/systemctl stop ${PG_SERVICE}/service ${PG_SERVICE} stop/g' /usr/bin/msfdb

RUN msfdb init && msfdb start
