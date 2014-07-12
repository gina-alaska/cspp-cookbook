include_recipe "cspp::_env"
include_recipe "cspp::_user"

template "#{software_path("uw-hyperspectral")}/run_HSRTV.bash" do
  source "run_HSRTV.bash.erb"
  mode 0755
end

node['cspp']['uw-hyperspectral']['components'].each do |name, component|
  component_install(component)
end
