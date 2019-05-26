FROM alpine:latest

# TODO msmtp passthrough (???)
# TODO gpg passthrough (gpg-agent)

RUN apk add python3 py3-notmuch notmuch gnupg gpgme gpgme-dev task neovim

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

# Create the user
RUN mkdir -p /home/user/ \
    && chmod -R 777 /home/user

ADD ./entrypoint /entrypoint
WORKDIR /home/user

ENTRYPOINT /entrypoint
