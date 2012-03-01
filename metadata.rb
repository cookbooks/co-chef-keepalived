maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and configures keepalived"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.8.1"
supports          "ubuntu"

recipe "keepalived", "Installs and configures keepalived"
recipe "ip_nonlocal_bind", "Allows nonlocal binding of IP addresses"
