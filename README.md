docker-archiva-1.3.6-standalone
===============================

A dock that provides Apache Archiva 1.3.6 standalone.

This Dockerfile is a pretty straightforward one to get Archiva. The file implements the recommended installation process from the home page:


Notes
-----

This line in the Dockerfile deserves explanation:

    RUN rm -f /opt/archiva/bin/wrapper-linux-x86-32

It turns out that this files hinders startup, for some reason, on this 64-bit install. Removing this unnecessary wrapper fixes the issue.

