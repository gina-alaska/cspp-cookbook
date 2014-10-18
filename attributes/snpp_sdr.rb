default['cspp']['snpp-sdr']['version'] = "SDR_2_0"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['snpp-sdr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_SDR_V2.0.tar.gz',
    'checksum' => '5ee25d39137a9e1ce728893f6f0b50fe923f55fb02bf0b8cd7e0eb4845b6abae',
    'creates' => 'SDR_2_0/viirs/viirs_sdr.sh',
    'action' => :install
  },
  'static-terrain' => {
    'url' => 'http://example.com/CSPP_SDR_V2.0_STATIC.tar.gz',
    'checksum' => '4fba0a1e4de557662e4295cb8cbe3f7d1be178b444bd9073356d937dcb092d52',
    'creates' => 'SDR_2_0/anc/static/ADL/data/tiles/Terrain-Eco-ANC-Tile',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_SDR_V2.0_CACHE.tar.gz',
    'checksum' => '7fed213eda23dda7fb0ada9ab0add86c3e2b3a08bfa296b30f366ae8c0b18f40',
    'creates' => 'SDR_2_0/anc/cache/luts',
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
