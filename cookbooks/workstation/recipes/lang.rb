cookbook_file '/etc/environment' do
  source 'environment.config'
  owner 'root'
  group 'root'
  mode '0644'
end
