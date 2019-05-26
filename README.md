# neomutt & friends container

This is my private docker container for running [neomutt](https://neomutt.org/), [notmuchmail](https://notmuchmail.org/), [afew](https://github.com/afewmail/afew), [taskwarrior](https://taskwarrior.org/) and [notmuchtask](https://github.com/neuhalje/notmuch-task) on homebrew.

Unfortunately it is neigh to impossible to install the notmuch python bindings via homebrew. So the solution was to put it in a Docker container.

Config files and dirs are mounted into the container.

## Configuring

The entry point transparently creates a user/group named `user` with the `uid`/`gid` of `1000` in order to use the correct user ids for file access.

`uid` and `gid` can be overridden by passing the environment variables `USER_ID` and `GROUP_ID` (see `run-container`) to docker (e.g. `docker run -e USER_ID=9999 -e GROUP_ID=1234 mailenv`).
