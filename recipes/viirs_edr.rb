include_recipe "cspp::_env"
include_recipe "cspp::_user"

template "/etc/profile.d/cspp_edr_env.sh" do
  mode 0644
  variables({
    version: node['cspp']['viirs-edr']['version']
  })
end

node['cspp']['viirs-edr']['components'].each do |name, component|
  cspp_component(component)
end
