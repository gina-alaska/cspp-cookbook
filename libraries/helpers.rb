def cspp_component component
  return if component['action'].to_s != 'install'

  include_recipe "tar::default"
  directory component_target_dir(component) do
    owner node['cspp']['user']
    group node['cspp']['user']
  end

  tar_extract component['url'] do
    target_dir component_target_dir(component)
    checksum component['checksum'] if component['checksum']
    user node['cspp']['user']
    group node['cspp']['user']
    creates ::File.join(component_target_dir(component), component['creates']) if component['creates']
  end

end


def component_cache(component)
  "#{Chef::Config[:file_cache_path]}/#{component_file(component)}"
end

def component_file(component)
  require 'uri'
  require 'pathname'

  Pathname.new(URI.parse(component['url']).path).basename.to_s
end

def component_target_dir(component)
  component['path'] || node['cspp']['path']
end

def software_path software
  ::File.join(node['cspp']['path'], node['cspp'][software]['version'])
end
