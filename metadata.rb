maintainer        "Coroutine, LLC"
maintainer_email  "bmontgomery@coroutine.com"
license           "Apache 2.0"
description       "Fork of the Opscode cookbook; Installs/configures keepalived"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.8.2"
supports          "ubuntu"

recipe "keepalived", "Installs and configures keepalived"
recipe "ip_nonlocal_bind", "Allows nonlocal binding of IP addresses"
