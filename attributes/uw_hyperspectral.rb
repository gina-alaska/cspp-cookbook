default['cspp']['uw-hyperspectral']['version'] = "CSPP_UW_HSRTV"

# Visit http://cimss.ssec.wisc.edu/cspp/download/ to register for download
default['cspp']['uw-hyperspectral']['components'] = {
  'app' => {
    'url' => 'http://example.com/CSPP_UW_HSRTV_V1.2.tar.gz',
    'path' => '/opt/cspp',
    'checksum' => 'f82f38ba7bd15cecca5241d45bb81abd117c2574dc107a4afcd0dc36eb6a01d2',
    'creates' => 'CSPP_UW_HSRTV/scripts/run_HSRTV.scr',
    'action' => :install
  },
  'coeffs' => {
    'url' => 'http://example.com/CSPP_UW_HSRTV_coeffs_v1.2.tar.gz',
    'path' => '/opt/cspp/CSPP_UW_HSRTV',
    'checksum' => '8696ca265a9cd2caea99634b53738cdb7de1f465cf3109df1469f4dffe796d1c',
    'creates' => 'CSPP_UW_HSRTV_coeffs',
    'action' => :install
  }
}
