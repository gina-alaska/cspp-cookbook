require File.expand_path('../support/helpers', __FILE__)

describe 'cspp::default' do

  include Helpers::Cspp
  describe "cspp" do
    it 'adds the cspp user' do
      user(node['cspp']['user']).must_exist
    end
    
    it 'configures the cspp environment' do
      file("/etc/profile.d/cspp_env.sh").must_exist.with(:mode, "644")
    end

    it 'installs dependencies' do
			package_dependencies.each do |pkg|
				package(pkg).must_be_installed
			end
    end
  end
end
