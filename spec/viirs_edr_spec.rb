require 'spec_helper'

describe "cspp::viirs_edr" do
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        before { Fauxhai.mock(platform: platform, version: version)}
        let(:chef_run){ ChefSpec::SoloRunner.new.converge(described_recipe) }

        it 'includes common recipes' do
          expect(chef_run).to include_recipe('cspp::_env')
          expect(chef_run).to include_recipe('cspp::_user')
        end

        it 'sets up the edr environment' do
          expect(chef_run).to create_template('/etc/profile.d/cspp_edr_env.sh').
            with(variables: {version:'EDR_1_2'}, mode: 0644)
        end

        it 'installs edr components' do

        end
      end
    end
  end
end
