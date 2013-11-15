name             "cspp"
maintainer       "Scott Macfarlane"
maintainer_email "scott@gina.alaska.edu"
license          "All rights reserved"
description      "Installs/Configures cspp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.2"

%w{centos}.each do |os|
  supports os
end

depends 'user'