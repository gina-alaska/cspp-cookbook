#
# Cookbook Name:: cspp
# Resource:: package
#
# The MIT License (MIT)
#
# Copyright (c) 2016 UAF GINA
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

property :software, String, required: true, name_property: true
property :install_path, String, default: '/opt/cspp'
property :source, String, required: true
property :version, String, required: true
property :ancillary, Array, default: []
property :patch, String
property :user, String
property :group, String
property :clean_cache, [TrueClass,FalseClass], default: true

default_action :install

load_current_value do |desired|
  current_value_does_not_exist! unless ::File.exist?(::File.join(desired.install_path, ".#{desired.software}.#{desired.version}.yml"))

  cr = YAML.load_file(::File.join(desired.install_path, ".#{desired.software}.#{desired.version}.yml"))

  source cr[:source]
  version cr[:version]
  patch cr[:patch]
  ancillary cr[:ancillary]
  user cr[:user]
  group cr[:group]
end

action :install do
  converge_if_changed :version, :ancillary do
    directory install_path do
      recursive true
      user new_resource.user
      group new_resource.group
    end

    [
      "CSPP_#{software}_V#{version}.tar.gz",
      ancillary.map{|a| "CSPP_#{software}_V#{version}_#{a}.tar.gz" }
    ].flatten.each do |filename|

      remote_file "#{Chef::Config[:file_cache_path]}/#{filename}" do
        source "#{new_resource.source}/#{filename}"
      end

      execute "extract-#{filename}" do
        command "tar xzf #{Chef::Config[:file_cache_path]}/#{filename} -C #{install_path}"
      end

      file "#{Chef::Config[:file_cache_path]}/#{filename}" do
        action :delete
        only_if { new_resource.clean_cache }
      end
    end
  end

  converge_if_changed :patch do
    filename = "CSPP_#{software}_V#{patch}_patch.tar.gz"
    remote_file "#{Chef::Config[:file_cache_path]}/#{filename}" do
      source "#{new_resource.source}/#{filename}"
      only_if { new_resource.patch }
    end

    execute "patch-sdr" do
      command "tar xzf #{Chef::Config[:file_cache_path]}/#{filename} -C #{install_path}"
      only_if { new_resource.patch }
    end

    file "#{Chef::Config[:file_cache_path]}/#{filename}" do
      action :delete
      only_if { new_resource.clean_cache }
      only_if { new_resource.patch }
    end
  end

  converge_if_changed :user, :group do
    execute "cspp-change-ownership" do
      command "chown #{new_resource.user}:#{new_resource.group} #{new_resource.install_path} -R"
    end
  end

  converge_if_changed do
    properties = new_resource.class.state_properties.map { |p| p.name.to_sym }
    properties = properties.each_with_object({}) do |name, o|
      o[name] = new_resource.send(name) if new_resource.property_is_set?(name)
    end

    file ::File.join(install_path, ".#{software}.#{version}.yml") do
      content properties.to_yaml
    end
  end
end
