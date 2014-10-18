require 'spec_helper'

describe "cspp::_user" do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  it 'adds the user account for cspp' do
    expect(chef_run).to create_user('processing')
  end
end
