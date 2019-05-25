# neomutt & friends container

This is my private docker container for running [neomutt](https://neomutt.org/), [notmuchmail](https://notmuchmail.org/), [afew](https://github.com/afewmail/afew), [taskwarrior](https://taskwarrior.org/) and [notmuchtask](https://github.com/neuhalje/notmuch-task) on homebrew.

Unfortunately it is neigh to impossible to install the notmuch python bindings via homebrew. So the solution was to put it in a Docker container.

Config files and dirs are mounted into the container.
