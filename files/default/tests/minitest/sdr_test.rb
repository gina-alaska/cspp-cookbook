require File.expand_path('../support/helpers', __FILE__)

describe "cspp::sdr" do
  include Helpers::Cspp
  # Example spec tests can be found at http://git.io/Fahwsw
  it 'creates the CSPP directory' do
    directory(cspp_sdr_home).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end  

  it 'extracts the cspp source' do
    file(::File.join(cspp_sdr_home, "viirs", "viirs_sdr.sh")).must_exist
  end

  it 'extracts the cspp cache files' do
    directory(::File.join(cspp_sdr_home, "anc", "cache", "luts")).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end

  it 'extracts the cspp static files' do
    directory(::File.join(cspp_sdr_home, "anc", "static", "ADL", "data", "tiles", "Terrain-Eco-ANC-Tile")).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end

  it 'configures the sdr environment' do
    file(::File.join(cspp_sdr_home, "cspp_sdr_env.sh")).must_exist.with(:owner, node['cspp']['user']).with(:mode, '755')
  end
end