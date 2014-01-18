include_recipe "cspp::default"

cspp_path = node['cspp']['path']
cris_hs_path =  cspp_path + "/#{node['cspp']['cris_hyperspectral']['path']}"

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
    "-C #{cspp_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cris_hs_path, "scripts/run_HSRTV.scr"))}
end

execute "Extract CRIS Hyperspectral Coeff Files" do
  command [
    "tar xvf",
    "#{node['cspp']['download_cache']}/#{node['cspp']['cris_hyperspectral']['coeffs']}",
    "-C #{cris_hs_path}"
  ].join " "
  user node['cspp']['user']
  group node['cspp']['user']
  not_if {::File.exists?(::File.join(cris_hs_path, "CSPP_UW_HSRTV_coeffs/CrIS_coeffs"))}
end
