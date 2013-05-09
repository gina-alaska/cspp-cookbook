#
# Cookbook Name:: cspp-cookbook
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
# 
# All rights reserved - Do Not Redistribute
#

user node['cspp']['user']

directory node['cspp']['home'] do
  owner node['cspp']['user']
  group node['cspp']['user']
  recursive true
end

template "#{node['cspp']['home']}/cspp_env.sh" do
  owner node['cspp']['user']
  group node['cspp']['user']
  mode 0755
end