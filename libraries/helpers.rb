def component_install component
  return if component['action'] != :install

  directory component['path']

  remote_file component_cache(component) do
    source component['url']
    checksum component['checksum'] if component['checksum']
    action :create
    notifies :extract, "libarchive_file[#{component_cache(component)}]"
  end

  libarchive_file component_cache(component) do
    path component_cache(component)
    extract_to component['path']
    owner node['cspp']['user']
    group node['cspp']['user']
    extract_options [:no_overwrite]
    action :nothing
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

def software_path software
  ::File.join(node['cspp']['path'], node['cspp'][software]['version'])
end
