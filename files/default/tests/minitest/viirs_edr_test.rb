require File.expand_path('../support/helpers', __FILE__)

describe "cspp::viirs_edr" do
  include Helpers::Cspp
  
  it 'extracts the edr source' do
    file(::File.join(cspp_edr_home, "cspp_edr_env.sh")).must_exist.with(:owner, node['cspp']['user']).with(:mode, '755')
  end
  
  it 'extracts the edr static files' do
    directory(::File.join(cspp_edr_home, "anc", "static", "LSM", "dem30ARC_Global_LandWater_uncompressed.h5")).must_exist.with(:owner, node['cspp']['user'])
  end
end
