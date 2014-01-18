default['cspp']['user'] = 'processing'
default['cspp']['path'] = "/opt/cspp"
default['cspp']['url'] = nil
default['cspp']['download_cache'] = "cspp_download_cache"

#Location of the CSPP installation packages
#SDR Home is relative to CSPP home
default['cspp']['sdr']['path'] = "SDR_1_5"
default['cspp']['sdr']['source'] = "CSPP_SDR_V1.5.tar.gz"
default['cspp']['sdr']['cache'] = "CSPP_SDR_V1.5_CACHE.tar.gz"
default['cspp']['sdr']['static'] = "CSPP_SDR_V1.5_STATIC.tar.gz"


#EDR Home is relative to CSPP Home
#Location of the CSPP EDR installation packages
default['cspp']['viirs_edr']['path'] = "EDR_1_2"
default['cspp']['viirs_edr']['source'] = "CSPP_VIIRS_EDR_V1.2.tar.gz"
default['cspp']['viirs_edr']['static'] = "CSPP_VIIRS_EDR_V1.2_STATIC.tar.gz"
default['cspp']['viirs_edr']['cache'] = "CSPP_VIIRS_EDR_V1.2_CACHE.tar.gz"


#CRIS Hyperspectral package.
# Home is relative to CSPP Home
default['cspp']['cris_hyperspectral']['path'] = "CSPP_UW_HSRTV"
default['cspp']['cris_hyperspectral']['source'] = "CSPP_UW_HSRTV_V1.2.tar.gz"
default['cspp']['cris_hyperspectral']['coeffs'] = "CSPP_UW_HSRTV_coeffs_v1.2.tar.gz"

default['users'] = [default['cspp']['user']]

#Cron jobs that need to be run to manage cspp
#  Set to false to disable
default['cspp']['cron']['ancillary'] = true
default['cspp']['cron']['luts'] = true

default['cspp']['dependencies'] = ['libgfortran', 'lftp']
