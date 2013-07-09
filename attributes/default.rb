default['cspp']['user'] = 'processing'
default['cspp']['home'] = "/opt/CSPP"
default['cspp']['download_cache'] = "cspp_download_cache"

#Location of the CSPP installation packages
#SDR Home is relative to CSPP home
default['cspp']['sdr']['home'] = "SDR_1_4"
default['cspp']['sdr']['source'] = "CSPP_SDR_V1.4.tar.gz"
default['cspp']['sdr']['source_sha1'] = 'a6a960bd410f446ba7f191653e6e36948ca6db46'
default['cspp']['sdr']['cache_files'] = "CSPP_SDR_V1.4_CACHE.tar.gz"
default['cspp']['sdr']['static_files'] = "adlTerEcoDataLinks_V1.2.tgz"
default['cspp']['sdr']['static_files_sha1'] = '28d54881902cb3f29d47f1d5b20c13a8fe3ad7e0'

#Configuration options for cspp_sdr_env.sh
#This options are relative to CSPP_SDR_HOME
#  There should be no reason to change these from the defaults
default['cspp']['sdr']['CSPP_ANC_CACHE_DIR'] = "/anc/cache"
default['cspp']['sdr']['CSPP_SDR_LUTS'] = "/luts"
default['cspp']['sdr']['CSPP_SDR_ANC_HOME'] = "/anc/static"
default['cspp']['sdr']['CSPP_SDR_ANC_TILE_PATH'] = "/ADL/data/tiles/Terrain-Eco-ANC-Tile/withMetadata"

#EDR Home is relative to CSPP Home
#Location of the CSPP EDR installation packages
default['cspp']['edr']['home'] = "EDR_1_0"
default['cspp']['edr']['source'] = "CSPP_VIIRS_EDR_V1.1.tar.gz"
default['cspp']['edr']['static_files'] = "CSPP_VIIRS_EDR_V1.1_STATIC.tar.gz"
default['cspp']['edr']['cache_files'] = "CSPP_VIIRS_EDR_V1.1_CACHE.tar.gz"

#Configuration options for cspp_edr_env.sh
#This options are relative to CSPP_EDR_HOME
#  There should be no reason to change these from the defaults
default['cspp']['edr']['CSPP_EDR_ANC_CACHE'] = "/anc/cache"
default['cspp']['edr']['CSPP_EDR_LUTS'] = "/luts"
default['cspp']['edr']['CSPP_EDR_ANC_HOME'] = "/anc/static"
default['cspp']['edr']['CSPP_EDR_ANC_TILE_PATH'] = "/ADL/data/tiles/Terrain-Eco-ANC-Tile/withMetadata"