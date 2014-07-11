default['cspp']['snpp-sdr']['version'] = "SDR_1_5"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['snpp-sdr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_SDR_V1.5.tar.gz',
    'path' => '/opt/cspp',
    'checksum' => 'e27525ad1dd37fcf2ea2b7dd0c72bc1ea7440c7864b2f3e3213f49d841bdd246',
    'action' => :install
  },
  'static-terrain' => {
    'url' => 'http://example.com/CSPP_SDR_V1.5_STATIC.tar.gz',
    'path' => '/opt/cspp',
    'checksum' => 'bf3ec0123f351378334099044d98f2d892aa69043c4414dfcb360d222bba7551',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_SDR_V1.5_CACHE.tar.gz',
    'path' => '/opt/cspp',
    'checksum' => '9343a0b6f490e6718737589a4bef67eb392c95831d99718d58db7ee960df1473',
    'action' => :install
  }
}


default['cspp']['snpp-sdr']['cron'] = {
  'ancillary' => false,
  'luts' => false
}
