Description
===========

This is a fork of the [Opscode keepalived cookbook](https://github.com/opscode/cookbooks/tree/master/keepalived). It installs keepalived and defines attributes that can be used to customize the configuration file. Additionally, there are configuration files tailored for:
* HAProxy
* (postgresql coming soon)

Changes
=======
## v0.8.1:
* Added `ip_nonlocal_bind` recipe

## v0.8.0:
* Added attributes for customization
* Added a customized config for HAProxy

## v0.7.1:

* Last public release from Opscode.

Attributes
==========
The following attributes are defined in this cookbook. See `attributes/default.rb` for default values.

* `node[:keepalived][:template_suffix]` - Specify a suffix to determine which template is used to write the config file for keepalived. E.G. specify "haproxy to use the `keepalived_haproxy.conf.erb` suffix. See the files in `templates/default/` for more information.
* `node[:keepalived][:backup_nodes]` - A list of node names that will act as a backup instance.
* node[:keepalived][:notification_email_from]` - the email address from which notifications are sent. This requires an SMTP server (see below).
* `node[:keepalived][:notification_emails]` - a list of email address to which notifications are sent. This requires an SMTP server (see below)
* `node[:keepalived][:smtp_server]` - The SMTP server used to send notification emails.
* `node[:keepalived][:smtp_connect_timeout]` - connection timeout for the SMTP server (e.g. 30)
* `node[:keepalived][:vrrp_instances]` - A list of hashes describing each vrrp instance. See the `attributes/default.rb` file for an example.
* `node[:keepalived][:virtual_servers]` - A list of hashes describing each virtual server (not yet complete).


Recipes
=======
This cookbook contains the following recipies.

`default`
---------
Installs and configures keepalived.

`ip_nonlocal_bind`
------------------
This recipe makes sure a system can find to a non-local ip address. This is required for IP Failover using a floating (virtual) IP address.

Usage
=====

Create a Role and override the attributes to fit your needs.

License and Author
==================

Author:: Brad Montgomery (<bmontgomery@opscode.com>)
Author:: Joshua Timberman (<joshua@opscode.com>)

Copyright:: 2009, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
