require 'puppet/provider/security'

Puppet::Type.type(:security_limit).provide :stanza, :parent => Puppet::Provider::Security::Stanza do
  desc "Manage /etc/security/limits entries on AIX using the Augeasprovider API"
  def initialize(f)

    # Map attributes to augeas fields to control what attributes
    # can be managed using this provider and map attributes
    # to different configuration variables across platforms.

    @attributes= {
      :fsize      => 'fsize',
      :core       => 'core',
      :cpu        => 'cpu',
      :data       => 'data',
      :stack      => 'stack',
      :rss        => 'rss',
      :nofiles    => 'nofiles',
      :fsize_hard => 'fsize_hard',
      :core_hard  => 'core_hard',
      :cpu_hard   => 'cpu_hard',
      :data_hard  => 'data_hard',
      :stack_hard => 'stack_hard',
      :rss_hard   => 'rss_hard',
      :nofiles_hard => 'nofiles_hard',
   }
   super
  end


  default_file do
    '/etc/security/limits'
  end

  lens { 'AIX_stanza.lns' }
end
