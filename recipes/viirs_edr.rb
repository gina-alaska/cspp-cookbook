include_recipe "cspp::default"

cspp_home = node['cspp']['home']
viirs_edr = node['cspp']['viirs_edr']
edr_home =  cspp_home + "/#{viirs_edr['home']}"


template "/etc/profile.d/cspp_edr_env.sh" do
  mode 0755
end

execute "Extract CSPP VIIRS EDR Source" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['source']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_home, "viirs/viirs_edr.sh"))}
end

execute "Extract CSPP VIIRS EDR Static Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['static_files']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_home, "anc/static/LSM/dem30ARC_Global_LandWater_uncompressed.h5"))}
end

execute "Extract CSPP VIIRS EDR Cache Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['cache_files']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_home, "anc/cache/NAAPS-ANC-Int"))}
end
