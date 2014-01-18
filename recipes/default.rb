#
# Cookbook Name:: cspp
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
# 
# All rights reserved - Do Not Redistribute
#

user node['cspp']['user']

directory node['cspp']['path'] do
  owner node['cspp']['user']
  group node['cspp']['user']
  recursive true
end

template "/etc/profile.d/cspp_env.sh" do
  mode 0644
end

Array(node['cspp']['dependencies']).each do |pkg|
	package pkg
end
