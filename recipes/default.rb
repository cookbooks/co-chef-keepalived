#
# Cookbook Name:: keepalived
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "keepalived" do
  action :install
end

service "keepalived" do
  supports :restart => true
  action [:enable, :start]
end

template_source = begin
  if node.keepalived.template_suffix.empty?
    "keepalived.conf.erb"
  else
    "keepalived_#{node.keepalived.template_suffix}.conf.erb"
  end
end

template "/etc/keepalived/keepalived.conf" do
  source template_source
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "keepalived")
end

# Set up notification scripts if they exist
node.keepalived.vrrp_instances.each do |instance|
  if instance['notify_scripts'] && (not instance['notify_scripts'].empty?)
    instance['notify_scripts'].each do |state, info|

      # create the directory for these
      directory "/etc/keepalived/scripts/#{instance['name']}" do
        owner "root"
        group "root"
        mode "0755"
        action :create
        recursive true
      end
    
      # write the script file
      template "/etc/keepalived/scripts/#{instance['name']}/notify_#{state}.sh" do
        source "notify_script.sh.erb"
        owner "root"
        group "root"
        mode "0755"
        variables(
          :command => info['command'],
          :args    => info['args']
       )
       notifies :restart, resources(:service => "keepalived"), :delayed
      end
    end
  end
end
