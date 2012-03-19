#
# Cookbook Name:: keepalived
# Attributes:: keepalived
#

# Which template to use; defaults to keepalived.conf.erb
# Other options include "vrrp" (for vrrp instances) or (TODO: "real"; for real servers)
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
    :track_script => {
      :name     => "",  # name for your track script, "eg: chk_haproxy"
      :script   => "",  # actual command to do the check, "eg: killall -0 haproxy"
      :interval => 2,   
      :weight   => 2
    },

    :notify_scripts => {
      :master => {
        :args => nil, # args for above shell script
        :command => nil # actual command to write in the above file
      },
      :backup => {
        :args => nil, # args for above shell script
        :command => nil # actual command to write in the above file
      },
      :fault => {
        :args => nil, # args for above shell script
        :command => nil # actual command to write in the above file
      }
    }
  }
]

# TODO: Define virtual servers as a list of hashes
default[:keepalived][:virtual_servers] = []
