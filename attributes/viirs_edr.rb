default['cspp']['viirs-edr']['version'] = "EDR_1_2"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['viirs-edr']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V1.2.tar.gz',
    'checksum' => 'd7d134624e11b1cc9544250a4ecac8fd0c358515d6409fe0e2ed33e65cd232f0',
    'creates' => 'EDR_1_2/viirs/viirs_edr.sh',
    'action' => :install
  },
  'static' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V1.2_STATIC.tar.gz',
    'checksum' => '762aa0e0ecdd41e9c1624e2caeff131db61bc8f47456e2bdf9d735eed5bba288',
    'creates' => 'EDR_1_2/anc/static/LSM/dem30ARC_Global_LandWater_uncompressed.h5',
    'action' => :install
  },
  'cache' => {
    'url' => 'http://example.com/CSPP_VIIRS_EDR_V1.2_CACHE.tar.gz',
    'checksum' => '9b2e3b38da92eeddf1854d4fb175c7a1dffc0a6256d39164035a5f7d5e1f4b69',
    'creates' => 'EDR_1_2/anc/cache/NAAPS-ANC-Int',
    'action' => :install
  }
}
