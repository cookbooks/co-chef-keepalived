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
    :state              => "MASTER",
    :nopreempt          => false,     # omitted if false, included if true
    :advert_int         => nil, # 
    :virtual_router_id  => 51,
    :priority           => 101,
    :virtual_ipaddress  => ["127.0.0.1"],
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
