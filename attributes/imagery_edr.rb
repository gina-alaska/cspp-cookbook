default['cspp']['imagery-edr']['version'] = "GTM_2_0"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['imagery-edr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_IMAGERY_EDR_V2.0.tar.gz',
    'checksum' => 'f5e570999bc5f76d7b04d124092a016b9d60c6582760d7ea6be75a1558d68fdf',
    'creates' => 'GTM_2_0/cspp_gtm_runtime.sh',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_IMAGERY_EDR_V2.0_CACHE.tar.gz',
    'checksum' => '1cbdf07d65633a6da9a8b7c50c6b51bf30e22560ac25761577a106953448fdc1',
    'creates' => 'GTM_2_0/anc/cache/luts',
    'action' => :install
  }
}
