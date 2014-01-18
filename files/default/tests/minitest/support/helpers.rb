module Helpers
  module Cspp
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
  
  
    def cspp_path
      node['cspp']['path']
    end
  
    def cspp_sdr_path
      ::File.join(cspp_path, node['cspp']['sdr']['path'])
    end
  
    def cspp_edr_path
      ::File.join(cspp_path, node['cspp']['viirs_edr']['path'])
    end

    def cris_hyperspectral_path
      ::File.join(cspp_path, node['cspp']['cris_hyperspectral']['path'])
    end
  end
  
end
