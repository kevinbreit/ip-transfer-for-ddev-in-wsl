# IP transfer for ddev in wsl

When your windows ip-address is changed the new ip will be transferred into the ddev config on your wsl and an infobox
will be displayed.

## Context

If you use xdebug with ddev inside your WSL you have to update your global ddev config:
`wsl ddev config global --xdebug-ide-location=<your ip>`. Only then xdebug can find your IDE that is running on your
Windows machine.
