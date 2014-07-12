include_recipe "cspp::_env"
include_recipe "cspp::_user"

node['cspp']['snpp-sdr']['dependencies'].each do |pkg|
  package pkg
end

node['cspp']['snpp-sdr']['components'].each do |name, component|
  component_install(component)
end

template "/etc/profile.d/cspp_sdr_env.sh" do
  mode 0644
  variables({
    version: node['cspp']['snpp-sdr']['version']
  })
end

cron "update ancillary data" do
  minute "0"
  hour "0"
  day "*"
  command "#{software_path('snpp-sdr')}/common/mirror_jpss_ancillary.bash"
  user node['cspp']['user']
  only_if { node['cspp']['snpp-sdr']['cron']['ancillary'] == true }
end

cron "update lookup tables" do
  minute "0"
  hour "0"
  day "*"
  command "#{software_path('snpp-sdr')}/common/mirror_jpss_luts.bash"
  user node['cspp']['user']
  only_if { node['cspp']['snpp-sdr']['cron']['luts'] == true }
end
