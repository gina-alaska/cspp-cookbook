name             "cspp"
maintainer       "Scott Macfarlane"
maintainer_email "scott@gina.alaska.edu"
license          "All rights reserved"
description      "Installs/Configures cspp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.0.0"

depends 'tar'

%w{centos redhat ubuntu}.each do |os|
  supports os
end
