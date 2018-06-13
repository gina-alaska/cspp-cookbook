describe directory('/opt/cspp') do
  it { should exist }
  it { should be_directory }
  its('owner') { should eq 'processing' }
  its('group') { should eq 'processing' }
end

describe directory('/opt/cspp/SDR_3_0') do
  it { should exist }
  it { should be_directory }
end
