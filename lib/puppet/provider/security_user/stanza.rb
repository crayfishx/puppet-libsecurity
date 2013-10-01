require 'puppet/provider/security'

Puppet::Type.type(:security_user).provide :stanza, :parent => Puppet::Provider::Security::Stanza do
  desc "Manage /etc/security/user entries on AIX using the Augeasprovider API"
  def initialize(f)

    # Map attributes to augeas fields to control what attributes
    # can be managed using this provider and map attributes
    # to different configuration variables across platforms.

    @attributes= {
			:account_locked => 'account_locked',
			:admin 		      => 'admin',
			:admgroups 		  => 'admgroups',
			:auth1 		      => 'auth1',
			:auth2 		      => 'auth2',
			:daemon 		    => 'daemon',
			:default_roles 	=> 'default_roles',
			:dictionlist 		=> 'dictionlist',
			:expires 		    => 'expires',
			:histexpire 		=> 'histexpire',
			:histsize 		  => 'histsize',
			:login 		      => 'login',
			:logintimes 		=> 'logintimes',
			:loginretries 	=> 'loginretries',
			:maxage         => 'maxage',
			:maxexpired 		=> 'maxexpired',
			:maxrepeats 		=> 'maxrepeats',
			:minage 		    => 'minage',
			:minalpha 		  => 'minalpha',
			:mindiff 		    => 'mindiff',
			:minlen 		    => 'minlen',
			:minother 		  => 'minother',
			:pwdchecks 		  => 'pwdchecks',
			:pwdwarntime 		=> 'pwdwarntime',
			:registry 		  => 'registry',
			:rlogin 		    => 'rlogin',
			:su 		        => 'su',
			:sugroups 		  => 'sugroups',
			:tpath 		      => 'tpath',
			:ttys 		      => 'ttys',
			:umask 		      => 'umask'
   }
   super
  end


  default_file do
    '/tmp/stanza'
  end

  lens { 'AIX_stanza.lns' }
end
