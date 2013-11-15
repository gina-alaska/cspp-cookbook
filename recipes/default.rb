#
# Cookbook Name:: cspp
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "user::data_bag"


directory node['cspp']['home'] do
  owner node['cspp']['user']
  group node['cspp']['user']
  recursive true
end

template "/etc/profile.d/cspp_env.sh" do
  mode 0644
end