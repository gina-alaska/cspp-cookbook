module Helpers
  module Cspp
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
  
  
    def cspp_home
      node['cspp']['home']
    end
  
    def cspp_sdr_home
      ::File.join(cspp_home, node['cspp']['sdr']['home'])
    end
  
    def cspp_edr_home
      ::File.join(cspp_home, node['cspp']['viirs_edr']['home'])
    end

    def cris_hyperspectral_home
      ::File.join(cspp_home, node['cspp']['cris_hyperspectral']['home'])
    end
  end
  
end
