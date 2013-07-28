require "printful/version"
require "printful/error"
require "printful/client"
require "printful/model"
require "printful/customer"
require "printful/order"
require "printful/product"
require "printful/recipient"
require "printful/item"

module Printful

  def self.api_key=(key)
    @api_key = key
  end

  def self.api_key
    @api_key || ENV['PRINTFUL_KEY']
  end

end
