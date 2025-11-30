poweroff
========

A bash script and corresponding Systemd service to shutdown a machine after some processes
triggered by remote services (e.g. backup) are done.


Setup
-----

1) Copy `poweroff.sh` to `/usr/local/bin/poweroff.sh` and adjust timeouts.

3) Copy `poweroff.service` to `/etc/systemd/system/poweroff.service`.

4) Run `systemctl daemon-reload` and `systemctl enable --now poweroff`


Usage
-----

The script waits initially (`TIMEOUT_START`) for files to be created in `/tmp/poweroff`.
After that, it checks periodically (`TIMEOUT_CHECK`) if those files are still there.
Once all files are deleted (by the remote processes) the script will call `poweroff`
and the machine will shut down.
