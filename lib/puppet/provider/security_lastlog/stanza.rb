require 'puppet/provider/security'

Puppet::Type.type(:security_lastlog).provide :stanza, :parent => Puppet::Provider::Security::Stanza do
  desc "Manage /etc/security/lastlog entries on AIX using the Augeasprovider API"
  def initialize(f)

    # Map attributes to augeas fields to control what attributes
    # can be managed using this provider and map attributes
    # to different configuration variables across platforms.

    @attributes= {
      :time_last_login              => 'time_last_login',
      :time_last_unsuccessful_login => 'time_last_unsuccessful_login',
      :tty_last_login               => 'tty_last_login',
      :tty_last_unsuccessful_login  => 'tty_last_unsuccessful_login',
      :host_last_login              => 'host_last_login',
      :host_last_unsuccessful_login => 'host_last_unsuccessful_login',
      :unsuccessful_login_count     => 'unsuccessful_login_count'
   }
   super
  end


  default_file do
    '/etc/lastlog'
  end

  lens { 'AIX_stanza.lns' }
end
