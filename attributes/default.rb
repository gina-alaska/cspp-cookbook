default['cspp']['user'] = 'processing'
default['cspp']['path'] = "/opt/cspp"
default['cspp']['url'] = "http://localhost"  #Needs to be a valid URL
default['cspp']['download_cache'] = "cspp_download_cache"

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

case node['platform_family']
when "rhel"
	default['cspp']['dependencies'] = ['libgfortran', 'lftp']
when "debian"
	default['cspp']['dependencies'] = ['libgfortran3', 'lftp']
else
	default['cspp']['dependencies'] = []
end
