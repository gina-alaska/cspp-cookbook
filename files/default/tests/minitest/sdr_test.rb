require File.expand_path('../support/helpers', __FILE__)

describe "cspp::sdr" do
  include Helpers::Cspp
  # Example spec tests can be found at http://git.io/Fahwsw
  it 'installs package dependencies' do
    package('libgfortran').must_be_installed
    package('lftp').must_be_installed
  end


  it 'creates the CSPP directory' do
    directory(cspp_sdr_path).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end  

  it 'extracts the cspp source' do
    file(::File.join(cspp_sdr_path, "viirs", "viirs_sdr.sh")).must_exist
  end

  it 'extracts the cspp cache files' do
    directory(::File.join(cspp_sdr_path, "anc", "cache", "luts")).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end

  it 'extracts the cspp static files' do
    directory(::File.join(cspp_sdr_path, "anc", "static", "ADL", "data", "tiles", "Terrain-Eco-ANC-Tile")).must_exist.with(:owner, node['cspp']['user']).with(:group, node['cspp']['user'])
  end

  it 'configures the sdr environment' do
    file(::File.join(cspp_sdr_path, "cspp_sdr_env.sh")).must_exist.with(:owner, node['cspp']['user']).with(:mode, '755')
  end

  # It looks like cron asserts are unable to evaluate non-root crontabs
  # Visual inspection on the created vm confirms the crontab is created as expected
  # it 'creates cron jobs to update ancillary data and lookup tables' do
  #   cron("update ancillary data").must_exist.with(:user, node['cspp']['user'])
  #   cron("update lookup tables").must_exist.with(:user, node['cspp']['user'])
  # end
end