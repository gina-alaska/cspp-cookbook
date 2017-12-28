user 'processing'
group 'processing'

cspp_package 'SDR' do
  source 'https://s3-us-west-2.amazonaws.com/gina-packages/SSEC/CSPP'
  version "3.0"
  patch "3.0.3"
end

cspp_ancillary_package 'SDR' do
  source 'https://s3-us-west-2.amazonaws.com/gina-packages/SSEC/CSPP'
  version "3.0"
  ancillary ["CACHE", "STATIC"]
  user 'processing'
  group 'processing'
end

