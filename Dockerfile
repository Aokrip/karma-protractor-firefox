FROM node:8

RUN apt-get update && \
    apt-get install -y \
    xvfb \
    wget \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    && apt-get clean

# install Firefox browser
RUN wget --no-verbose -O /tmp/firefox.tar.bz2 https://ftp.mozilla.org/pub/firefox/releases/61.0/linux-x86_64/en-US/firefox-61.0.tar.bz2 \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && ln -fs /opt/firefox/firefox /usr/bin/firefox

RUN firefox --version

USER node
