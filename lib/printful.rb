require "printful/version"
require "printful/client"
require "printful/model"
require "printful/customer"
require "printful/order"
require "printful/product"

module Printful

  def self.default_client
    @default_client ||= Client.new(api_key: api_key)
  end

  def self.api_key=(key)
    @api_key = key
  end

  def api_key
    @api_key || ENV['PRINTFUL_KEY']
  end

end
