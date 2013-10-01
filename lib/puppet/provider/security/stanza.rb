require File.dirname(__FILE__) + '/../../../augeasproviders/provider'

class Puppet::Provider::Security::Stanza < Puppet::Provider
  include AugeasProviders::Provider

  attr_reader :attributes
  def initialize(o)
    super
  end

  def exists?
    augopen do |aug|
      aug.match("section[. = '#{resource[:domain]}']").empty? == false
    end
  end

  def create
    augopen! do |aug|
      aug.set('section[last()+1]', @resource[:domain])
    end
  end

  def value
    augopen do |aug|
      aug.get("section[. = '#{@resource[:domain]}']/#{@attributes[@resource[:attribute].to_sym]}")
      end
  end

  def value=(v)

    puts "section[. = '#{@resource[:domain]}']/#{@attributes[@resource[:attribute].to_sym]} to #{v}"
    augopen! do |aug|
      aug.set("section[. = '#{@resource[:domain]}']/#{@attributes[@resource[:attribute].to_sym]}", v)
    end
  end

  def destroy
    augopen! do |aug|
      aug.rm("section[. = '#{@resource[:domain]}]/#{@attributes[@resource[:attribute].to_sym]}")
    end
  end
end



