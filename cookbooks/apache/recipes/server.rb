#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'httpd' do
 action :install
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

remote_file '/var/www/html/pic.jpg' do
  source 'https://media2.fdncms.com/clevescene/imager/its-like-looking-in-a-mirror-isnt-it/u/original/2775781/1323786644-not-attractive.jpg'
end


template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
  notifies :restart, 'service[httpd]', :immediately
end

bash "inline script" do
  user "root"
  code "mkdir -p /var/www/mysitess/ && chown -R apache /var/www/mysites/"
#  not_if '[ -d /var/www/mysites/ ]'
  not_if do
   File.directory?('/var/www/mysites/')
  end
end

directory "/var/www/mysites" do
  owner 'apache'
  recursive true
end



service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
