#
# Cookbook Name:: cspp
# Recipe:: default
#
# Copyright (C) 2013 Scott Macfarlane
#
# All rights reserved - Do Not Redistribute
#

include_recipe "cspp::snpp_sdr"
include_recipe "cspp::viirs_edr"
include_recipe "cspp::uw_hyperspectral"
