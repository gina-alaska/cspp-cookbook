template "/etc/profile.d/cspp_env.sh" do
  mode 0644
  variables({ cspp_home: node['cspp']['path'] })
end
