include_recipe "cspp-cookbook::default"

cspp_home = "#{node['cspp']['home']}"
edr_home =  cspp_home + "/#{node['cspp']['edr']['home']}"

execute "Extract CSPP VIIRS EDR Source" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['edr']['source']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_home, "cspp_edr_env.sh"))}
end

execute "Extract CSPP VIIRS EDR Static Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['edr']['static_files']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(edr_home, "/anc/static/asc_templates"))}
end

template "#{edr_home}/cspp_edr_env.sh" do
  user node['cspp']['user']
  group node['cspp']['user']
  mode 0755
end
