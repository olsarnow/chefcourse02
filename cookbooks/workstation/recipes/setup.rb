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
  variables(
    name: 'Olaf Sarnow'
  )
  action :create
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action %i[enable start]
end

user 'user1' do
  comment 'test user'
  uid '5000'
  home '/home/user1'
  shell '/sbin/nologin'
end

group 'usergroup' do
  members 'user1' 
  append true
end


