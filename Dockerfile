FROM alpine:latest
RUN apk add python3 py3-notmuch notmuch gnupg task

RUN apk add git  alpine-sdk libxslt libxml2-utils gettext glib-dev ncurses-libs ncurses-dev libidn-dev

RUN mkdir -p /tmp/build && \ 
cd /tmp/build 

# This sometimes hangs
RUN git clone --quiet https://github.com/neomutt/neomutt 

RUN cd neomutt && \ 
./configure --disable-doc && \
make  && \
make install

RUN cd /tmp/build

# This sometimes hangs
RUN git clone --quiet https://github.com/teythoon/afew.git

RUN cd afew && \
python3 setup.py install && \ 
rm -rf /tmp/build && \ 
pip3 install notmuchtask task
