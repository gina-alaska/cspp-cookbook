#
# Cookbook Name:: cspp-cookbook
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
# 
# All rights reserved - Do Not Redistribute
#

user node['cspp']['user']

if node['recipes'].include? "dbvm-cookbook::default"
  node.set['cspp']['home'] = node['dbvm']['HOME'] + "/apps/CSPP"
  node.set['cspp']['user'] = node['dbvm']['user']
end

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