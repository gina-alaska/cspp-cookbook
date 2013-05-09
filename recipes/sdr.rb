cspp_home = "#{node['cspp']['home']}/#{node['cspp']['sdr']['home']}"

execute "Extract CSPP Source" do
  command [
    "tar xvf",
    "#{node['cspp']['sdr']['download_cache']}/#{node['cspp']['sdr']['source']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cspp_home, "viirs", "viirs_sdr.sh"))}
end

execute "Extract CSPP Cache Files" do
  command [
    "tar xvf",
    "#{node['cspp']['sdr']['download_cache']}/#{node['cspp']['sdr']['cache_files']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cspp_home, "anc","cache","luts"))}
end

execute "Extract CSPP Static Files" do
  command [
    "tar xvf",
    "#{node['cspp']['sdr']['download_cache']}/#{node['cspp']['sdr']['static_files']}",
    "-C #{cspp_home}/anc/static"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cspp_home, "anc", "static", "ADL", "data", "tiles", "Terrain-Eco-ANC-Tile"))}
end

template "#{cspp_home}/cspp_sdr_env.sh" do
  mode 0755
  owner node['cspp']['user']
  group node['cspp']['group']
end