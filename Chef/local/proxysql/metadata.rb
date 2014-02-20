name             'proxysql'
maintainer       'Marc Siebeneicher'
maintainer_email 'm.siebeneicher@googlemail.com'
license          'The MIT License (MIT)'
description      'Installs/Configures a ProxySQL server (http://www.proxysql.com/)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends "apt"
depends "git"