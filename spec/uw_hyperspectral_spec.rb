require 'spec_helper'

describe "cspp::uw_hyperspectral" do
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        before { Fauxhai.mock(platform: platform, version: version)}
        let(:chef_run){ ChefSpec::SoloRunner.new.converge(described_recipe) }

        it 'includes common recipes' do
          expect(chef_run).to include_recipe('cspp::_env')
          expect(chef_run).to include_recipe('cspp::_user')
        end

        it 'sets up the uw-hyperspectral driver script' do
          expect(chef_run).to create_template('/opt/cspp/CSPP_UW_HSRTV/run_HSRTV.bash').
            with(source: 'run_HSRTV.bash.erb', mode: 0755)
        end

        it 'installs uw-hyperspectral components' do

        end
      end
    end
  end
end
