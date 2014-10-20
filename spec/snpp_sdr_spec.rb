require 'spec_helper'

describe "cspp::snpp_sdr" do
  supported_platforms.each do |platform, versions|
    versions.each do |version|
      context "on #{platform.capitalize} #{version}" do
        let(:chef_run) do
          chef = ChefSpec::SoloRunner.new
          chef.node.set['cspp']['snpp-sdr']['dependencies'] = %w{foo bar}
          chef.converge(described_recipe)
        end

        before do
          Fauxhai.mock(platform: 'centos', version: '7.0')
        end

        it 'includes support recipes' do
          expect(chef_run).to include_recipe("cspp::_env")
          expect(chef_run).to include_recipe("cspp::_user")
        end

        it 'installs dependencies' do
          %w{foo bar}.each do |dep|
            expect(chef_run).to install_package(dep)
          end
        end

        it 'creates snpp env script' do
          expect(chef_run).to create_template("/etc/profile.d/cspp_sdr_env.sh").
            with( mode: 0644,
                  variables: {
                    version: 'SDR_2_0'
                  })
        end

        context 'cron jobs enabled' do
          let(:chef_run){ChefSpec::SoloRunner.new}
          before do
            chef_run.node.set['cspp']['snpp-sdr']['cron']['ancillary'] = true
            chef_run.node.set['cspp']['snpp-sdr']['cron']['luts'] = true
            chef_run.converge(described_recipe)
          end
          it 'enables cron jobs' do
            expect(chef_run).to create_cron("update ancillary data").
              with( minute: "0",
                    hour: "0",
                    day: "*",
                    command: "/opt/cspp/SDR_2_0/common/mirror_jpss_ancillary.bash",
                    user: "processing")
            expect(chef_run).to create_cron("update lookup tables").
              with( minute: "0",
                    hour: "0",
                    day: "*",
                    command: "/opt/cspp/SDR_2_0/common/mirror_jpss_luts.bash",
                    user: "processing")
          end
        end

        context 'cron jobs disabled' do
          before do
            chef_run.node.set['cspp']['snpp-sdr']['cron']['ancillary'] = false
            chef_run.node.set['cspp']['snpp-sdr']['cron']['luts'] = false
          end

          it 'doesnt add cron jobs' do
            expect(chef_run).not_to create_cron("update ancillary data")
            expect(chef_run).not_to create_cron("update lookup tables")
          end
        end


      end
    end
  end
end
