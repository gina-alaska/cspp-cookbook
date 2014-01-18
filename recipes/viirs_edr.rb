include_recipe "cspp::default"

cspp_path = node['cspp']['path']
viirs_edr = node['cspp']['viirs_edr']
edr_path =  cspp_path + "/#{viirs_edr['path']}"


template "/etc/profile.d/cspp_edr_env.sh" do
  mode 0644
end

%w{source cache static}.each do |cspp_file|
  remote_file "#{node['cspp']['download_cache']}/#{node['cspp']['viirs_edr'][cspp_file]}" do
    source "#{node['cspp']['url']}/#{node['cspp']['viirs_edr'][cspp_file]}"
    not_if { ::File.exists?("#{node['cspp']['download_cache']}/#{node['cspp']['viirs_edr'][cspp_file]}")}
  end
end

execute "Extract CSPP VIIRS EDR Source" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['source']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_path, "viirs/viirs_edr.sh"))}
end

execute "Extract CSPP VIIRS EDR Static Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['static']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_path, "anc/static/LSM/dem30ARC_Global_LandWater_uncompressed.h5"))}
end

execute "Extract CSPP VIIRS EDR Cache Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{viirs_edr['cache']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_path, "anc/cache/NAAPS-ANC-Int"))}
end

