default['cspp']['snpp-sdr']['version'] = "SDR_2_0"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['snpp-sdr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_SDR_V2.1.tar.gz',
    'checksum' => '140147bc21633f8f33c8212c51023118b694f16b104d7684acaaf52a9a27592e',
    'creates' => 'SDR_2_1/viirs/viirs_sdr.sh',
    'action' => :install
  },
  'static-terrain' => {
    'url' => 'http://example.com/CSPP_SDR_V2.1_STATIC.tar.gz',
    'checksum' => '935607612d81f94287b94235a1d380b8a7213117044fd0e97de26373e4c056bc',
    'creates' => 'SDR_2_1/anc/static/ADL/data/tiles/Terrain-Eco-ANC-Tile',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_SDR_V2.1_CACHE.tar.gz',
    'checksum' => '4c560e465cdcb66d7e2bd96de15f633dfdf7f34931d883dc50511187e338dc0c',
    'creates' => 'SDR_2_1/anc/cache/luts',
    'action' => :install
  }
}

default['cspp']['snpp-sdr']['cron'] = {
  'ancillary' => false,
  'luts' => false
}

default['cspp']['snpp-sdr']['dependencies'] = case node['platform_family']
when 'rhel'
  ['libgfortran', 'lftp', 'wget']
when 'debian'
  ['libgfortran3', 'lftp', 'wget']
else
  []
end
