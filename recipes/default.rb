#
# Cookbook Name:: cspp
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
#
# All rights reserved - Do Not Redistribute
#

Array(node['cspp']['dependencies']).each do |pkg|
	package pkg
end
