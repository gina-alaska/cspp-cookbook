include_recipe "cspp::default"

cspp_path = node['cspp']['path']
sdr_path =  cspp_path + "/#{node['cspp']['sdr']['path']}"

template "/etc/profile.d/cspp_sdr_env.sh" do
  mode 0644
end

%w{source cache static}.each do |cspp_file|
  remote_file "#{node['cspp']['download_cache']}/#{node['cspp']['sdr'][cspp_file]}" do
    source "#{node['cspp']['url']}/#{node['cspp']['sdr'][cspp_file]}"
    not_if { ::File.exists?("#{node['cspp']['download_cache']}/#{node['cspp']['sdr'][cspp_file]}")}
  end
end

execute "Extract CSPP Source" do
  command [
    "tar xf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['sdr']['source']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(sdr_path, "viirs", "viirs_sdr.sh"))}
end

execute "Extract CSPP Cache" do
  command [
    "tar xf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['sdr']['cache']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(sdr_path, "anc","cache","luts"))}
end

execute "Extract CSPP Static" do
  command [
    "tar xf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['sdr']['static']}",
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(sdr_path, "anc/static/ADL/data/tiles/Terrain-Eco-ANC-Tile/noMetadata/Terrain-Eco-ANC-Tile_S0448"))}
end


cron "update ancillary data" do
  minute "0"
  hour "0"
  day "*"
  command "#{sdr_path}/bin/mirror_jpss_ancillary.bash"
  user node['cspp']['user']
  only_if { node['cspp']['cron']['luts'] == true }
end

cron "update lookup tables" do
  minute "0"
  hour "0"
  day "*"
  command "#{sdr_path}/bin/mirror_jpss_luts.bash"
  user node['cspp']['user']
  only_if { node['cspp']['cron']['luts'] == true }
end
