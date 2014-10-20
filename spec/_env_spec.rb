require 'spec_helper'

describe "cspp::_env" do

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe)}

  it 'sets the cspp environment' do
    expect(chef_run).to create_template('/etc/profile.d/cspp_env.sh').
      with(mode: 0644, variables: { cspp_home: '/opt/cspp' })
  end
end
