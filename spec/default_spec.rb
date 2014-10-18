require 'spec_helper'

describe "cspp::default" do
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        before { Fauxhai.mock(platform: platform, version: version)}
        let(:chef_run){ ChefSpec::SoloRunner.new.converge(described_recipe) }

        it 'includes all sub-components' do
          expect(chef_run).to include_recipe('cspp::snpp_sdr')
          expect(chef_run).to include_recipe('cspp::viirs_edr')
          expect(chef_run).to include_recipe('cspp::uw_hyperspectral')
        end
      end
    end
  end
end
