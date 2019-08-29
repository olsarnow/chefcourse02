package 'vim-enhanced'
package 'emacs'

package 'tree' do
  action :install
end

package 'git' do
  action :install
end

package 'ntp'


file '/etc/motd' do
  content "This server is the property of Olaf Sarnow
HOSTNAME:#{node['hostname']}
IP: #{node['ipaddress']}
CPU: #{node['cpu']['0']['mhz']}
MEMORY: #{node['memory']['total']}
"
  action :create
  owner 'root'
  group 'root'
end


service 'ntpd' do
  action [ :enable, :start ]
end
