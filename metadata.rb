name             "cspp-cookbook"
maintainer       "Scott Macfarlane"
maintainer_email "scott@gina.alaska.edu"
license          "All rights reserved"
description      "Installs/Configures cspp-cookbook"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.1"

%w{redhat, centos}.each do |os|
  supports os
end

recommends "dbvm-cookbook"