default['cspp']['user'] = 'processing'
default['cspp']['home'] = "/opt/cspp"
default['cspp']['download_cache'] = "cspp_download_cache"

#Location of the CSPP installation packages
#SDR Home is relative to CSPP home
default['cspp']['sdr']['home'] = "SDR_1_4"
default['cspp']['sdr']['source'] = "CSPP_SDR_V1.4.tar.gz"
default['cspp']['sdr']['source_sha1'] = 'a6a960bd410f446ba7f191653e6e36948ca6db46'
default['cspp']['sdr']['cache_files'] = "CSPP_SDR_V1.4_CACHE.tar.gz"
default['cspp']['sdr']['static_files'] = "adlTerEcoDataLinks_v1.2.tgz"
default['cspp']['sdr']['static_files_sha1'] = '28d54881902cb3f29d47f1d5b20c13a8fe3ad7e0'


#EDR Home is relative to CSPP Home
#Location of the CSPP EDR installation packages
default['cspp']['viirs_edr']['home'] = "EDR_1_1"
default['cspp']['viirs_edr']['source'] = "CSPP_VIIRS_EDR_V1.1.tar.gz"
default['cspp']['viirs_edr']['static_files'] = "CSPP_VIIRS_EDR_V1.1_STATIC.tar.gz"
default['cspp']['viirs_edr']['cache_files'] = "CSPP_VIIRS_EDR_V1.1_CACHE.tar.gz"


default['users'] = [default['cspp']['user']]