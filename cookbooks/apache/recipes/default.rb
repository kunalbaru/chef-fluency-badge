#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Install apache package
if node['platform_family'] == "redhat"
	package = "httpd"
elsif node['platform_family'] == "debian"
	package = "apache2"
end

package 'apache' do
	package_name package
	action :install
end

service 'apache' do
	service_name 'httpd'
	action [:start, :enable]
end

include_recipe 'apache:websites'
