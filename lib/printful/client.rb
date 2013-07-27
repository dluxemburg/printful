require 'faraday'
require 'faraday_middleware'

module Printful
  class Client

    attr_accessor :api_key

    def initialize(options)
      @api_key = options[:api_key]
    end

    def get(path,params={})
      connection.get(path,params) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Content-Length'] = '4'
        req.body = "null"
      end
    end

    def post(path,data={})
      connection.post(path,data)
    end

    def username
      api_key.split(':').first
    end

    def password
      api_key.split(':').last
    end

    def connection
      @connection ||= Faraday.new("http://api.theprintful.com/v1/") do |faraday|
        faraday.request    :basic_auth, username, password
        faraday.response   :json
        faraday.response   :logger
        faraday.adapter    Faraday.default_adapter
      end
    end

  end
end
