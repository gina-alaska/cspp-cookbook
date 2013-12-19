include_recipe "cspp::default"

cspp_home = node['cspp']['home']
cris_hs_home =  cspp_home + "/#{node['cspp']['cris_hyperspectral']['home']}"

template "/etc/profile.d/cris_hyperspectral_env.sh" do
  mode 0644
end


%w{source coeffs}.each do |cspp_file|
  remote_file "#{node['cspp']['download_cache']}/#{node['cspp']['cris_hyperspectral'][cspp_file]}" do
    source "#{node['cspp']['url']}/#{node['cspp']['cris_hyperspectral'][cspp_file]}"
    not_if { ::File.exists?("#{node['cspp']['download_cache']}/#{node['cspp']['cris_hyperspectral'][cspp_file]}")}
  end
end

execute "Extract CRIS Hyperspectral Source" do
  command [
    "tar xvf",                               
    "#{node['cspp']['download_cache']}/#{node['cspp']['cris_hyperspectral']['source']}",
    "-C #{cspp_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cris_hs_home, "scripts/run_HSRTV.scr"))}
end

execute "Extract CRIS Hyperspectral Coeff Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['cris_hyperspectral']['coeffs']}",
    "-C #{cris_hs_home}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cris_hs_home, "CSPP_UW_HSRTV_coeffs/CrIS_coeffs"))}
end
