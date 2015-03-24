include_recipe "cspp::_env"
include_recipe "cspp::_user"

node['cspp']['imagery-edr']['components'].each do |name, component|
  cspp_component(component)
end

template "/etc/profile.d/cspp_gtm_env.sh" do
  mode 0644
  variables({
    version: node['cspp']['imagery-edr']['version']
  })
end
