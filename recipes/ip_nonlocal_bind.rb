#
# Cookbook Name:: keepalived
# Recipe:: ip_nonlocal_bind
#
# Copyright 2012, Coroutine LLC
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


bash "" do
  user "root"
  code <<-EOH
    echo "net.ipv4.ip_nonlocal_bind=1" >> /etc/sysctl.conf
    sysctl -p
  EOH
  action :run
  not_if "grep 'net.ipv4.ip_nonlocal_bind=1' /etc/sysctl.conf"
  notifies :restart, resources(:service => "keepalived")
end
