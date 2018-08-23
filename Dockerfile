FROM centos:latest

RUN yum makecache fast && yum -y update && yum clean all && yum history new \
    && yum -y install bzip2 fontconfig git vim wget gtk3 libXt \
    && curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs

# install Firefox browser
RUN wget --no-verbose -O /tmp/firefox.tar.bz2 https://ftp.mozilla.org/pub/firefox/releases/61.0/linux-x86_64/en-US/firefox-61.0.tar.bz2 \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && ln -fs /opt/firefox/firefox /usr/bin/firefox

RUN firefox --version

RUN mkdir /opt/app-root/

RUN useradd -u 1001 -r -g 0 -d /opt/app-root/src -s /sbin/nologin \
    -c "Default Application User" default && \
    chown -R 1001:0 /opt/app-root/ && chmod -R ug+rwx /opt/app-root/

USER 1001
