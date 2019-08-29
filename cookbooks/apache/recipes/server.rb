#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'httpd' do
 action :install
end


file '/var/www/html/index.html' do
  content "<h1>Hello world</h1><br><h2>#{node['hostname']}</h2><br><h2>#{node['ipaddress']}</h2>
"
end

service 'httpd' do
  action [ :enable, :start ]
end
