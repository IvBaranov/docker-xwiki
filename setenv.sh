#!/bin/sh

export JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
CATALINA_OPTS="-Xms4096M -Xmx4096M -XX:PermSize=512M -XX:MaxPermSize=512M"