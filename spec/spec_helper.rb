$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'printful'

module PrintfulTest
  def self.printful_key
    if ENV['PRINTFUL_KEY']
      ENV['PRINTFUL_KEY']
    elsif File.exists?(File.expand_path('../../printful_key', __FILE__))
      File.open(File.expand_path('../../printful_key', __FILE__)).read.chop
    end
  end
end
