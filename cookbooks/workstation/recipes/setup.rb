package 'vim-enhanced'
package 'emacs'

package 'tree' do
  action :install
end

package 'git' do
  action :install
end

package 'ntp'

template '/etc/motd' do
  source 'motd.erb'
  action :create
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action %i[enable start]
end
