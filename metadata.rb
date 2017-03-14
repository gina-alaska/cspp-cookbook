name             "cspp"
maintainer       "UAFGINA"
maintainer_email "support+cookbooks@gina.alaska.edu"
license          "MIT"
description      "Installs/Configures cspp"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "3.1.0"

%w{centos redhat ubuntu}.each do |os|
  supports os
end
