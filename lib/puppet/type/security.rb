class Puppet::Type::Security
  def initialize(puppettype, description='Manage security files')
    Puppet::Type.newtype(puppettype) do
      ensurable
      desc description

      newparam(:name, :namevar => true) do
        desc "The name of the resource you are managing.  The title/name is delimited with a slash in the format <domain>/<attribute>."
      end
  
      newparam(:target) do
        desc "Path to the file to manage"
      end

      newparam(:domain) do
        defaultto { @resource[:name].split(/\//)[0] }
      end

      newparam(:attribute) do
        defaultto { @resource[:name].split(/\//)[1] }
        validate do |value|
          raise ArgumentError, "Invalid attribute #{value} for provider #{provider.class}" unless provider.attributes.has_key?(value.to_sym)
        end
      end

      newproperty(:value) do
        desc "Configuration value to set"
      end

    end
  end
end

