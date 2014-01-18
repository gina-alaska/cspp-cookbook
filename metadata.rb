name             "cspp"
maintainer       "Scott Macfarlane"
maintainer_email "scott@gina.alaska.edu"
license          "All rights reserved"
description      "Installs/Configures cspp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.5.5"

%w{centos redhat ubuntu}.each do |os|
  supports os
end
