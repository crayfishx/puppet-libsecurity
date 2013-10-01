require 'puppet/provider/security'

Puppet::Type.type(:security_login).provide :stanza, :parent => Puppet::Provider::Security::Stanza do
  desc "Manage /etc/security/login.cfg entries on AIX using the Augeasprovider API"
  def initialize(f)

    # Map attributes to augeas fields to control what attributes
    # can be managed using this provider and map attributes
    # to different configuration variables across platforms.

    @attributes= {
			:herald 	      => 'herald',
			:logindelay 	  => 'logindelay',
			:logindisable 	=> 'logindisable',
			:logininterval 	=> 'logininterval',
			:loginreenable 	=> 'loginreenable',
			:logintimes 	  => 'logintimes',
			:pwdprompt 	    => 'pwdprompt',
			:sak_enabled 	  => 'sak_enabled',
			:synonym 	      => 'synonym',
			:usernameecho 	=> 'usernameecho',
			:auth_method 	  => 'auth_method',
			:shells 	      => 'shells',
			:maxlogins 	    => 'maxlogins',
			:logintimeout 	=> 'logintimeout',
			:auth_type 	    => 'auth_type',
			:maxroles 	    => 'maxroles',
			:pwd_algorithm 	=> 'pwd_algorithm'
   }
   super
  end

  default_file do
    '/etc/security/login.cfg'
  end

  lens { 'AIX_stanza.lns' }
end
