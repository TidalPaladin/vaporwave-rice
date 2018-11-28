dd-math implements a scratchpad dropdown service for quick math calculations.
Currently uses ipython as the interpreter.

dd-tmux implements a tmux dropdown for superuser tasks

Copy both to `/etc/sv/` and symlink to `/var/service/` like any other runit
service. The `run` script for both files will need to be modified with user
specific information.
