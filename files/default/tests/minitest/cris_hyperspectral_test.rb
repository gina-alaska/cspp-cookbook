require File.expand_path('../support/helpers', __FILE__)

describe 'cspp::cris_hyperspectral' do

  include Helpers::Cspp

  it 'extracts the cris hyperspectral source' do
    file(::File.join(cris_hyperspectral_home, "bin", "uw_hsrtv_CrIS.exe")).must_exist
  end

  it 'extracts the cris coeff files' do
  	directory(::File.join(cris_hyperspectral_home, "CSPP_UW_HSRTV_coeffs")).must_exist
  end

  it 'configures the cris hyperspectral environment' do
  	file("/etc/profile.d/cris_hyperspectral_env.sh").must_exist.with(:mode, 0755)
  end

end