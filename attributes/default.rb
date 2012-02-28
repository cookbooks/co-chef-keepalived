#
# Cookbook Name:: keepalived
# Attributes:: keepalived
#

# Which template to use. Including haproxy
default[:keepalived][:template_suffix] = ""
default[:keepalived][:notification_emails] = []
default[:keepalived][:notification_email_from] = "root@localhost"
default[:keepalived][:smtp_server] = nil
default[:keepalived][:smtp_connect_timeout] = nil

default[:keepalived][:vrrp_instances] = [
  # define a hash for each vrrp_instance:
  {
    :name               => "VI_1",
    :interface          => "eth0",
    :nopreempt          => false,     # omitted if false, included if true
    :advert_int         => nil, # Advertisement Interval (in seconds)
    :virtual_router_id  => 51,
    :master_priority    => 101,     # Priority to use on the Master
    :backup_priority    => 100,     # Priority to use on the Backup
    :virtual_ipaddress  => ["127.0.0.1"],
    :backup_nodes       => [], # node names for backup hosts. These will
                               # be listed with a BACKUP state.
    :track_script      => {
      :name     => "chk_haproxy",
      :script   => "killall -0 haproxy",
      :interval => 2,
      :weight   => 2
    }  
  }
]

# TODO: Define virtual servers as a list of hashes
default[:keepalived][:virtual_servers] = []
