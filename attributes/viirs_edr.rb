default['cspp']['viirs-edr']['version'] = "EDR_2_0"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['viirs-edr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V2.0.tar.gz',
    'checksum' => '31af1e2753944706ceefbe6846c54bffcba7d470f8be16a332b7f4e81ce09a6e',
    'creates' => 'EDR_2_0/viirs/viirs_edr.sh',
    'action' => :install
  },
  'static' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V2.0_STATIC.tar.gz',
    'checksum' => 'b67a57eb034a6169210da06e6175637c110e0accddae5a35054080dc8d58e977',
    'creates' => 'EDR_2_0/anc/static/LSM/dem30ARC_Global_LandWater_uncompressed.h5',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V2.0_CACHE.tar.gz',
    'checksum' => 'd50e3769496c1455347e8513b58961aadfaa76c516805268f49f3b861521fb0e',
    'creates' => 'EDR_2_0/anc/cache/NAAPS-ANC-Int',
    'action' => :install
  }
}
