require File.dirname(__FILE__) + '/security'

Puppet::Type::Security.new(:security_limit, 'Manage limits on UNIX variants')

