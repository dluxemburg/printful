require 'faraday'
require 'faraday_middleware'

module Printful
  class Client

    class Error < Printful::Error; end

    attr_accessor :api_key

    def self.default_client
      @default_client ||= self.new(api_key: Printful.api_key)
    end

    def initialize(options)
      @api_key = options[:api_key]
    end

    def get(path,params={})
      response = connection.get(path,params) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Content-Length'] = '4'
        req.body = "null"
      end
      process_response(response,path)
    end

    def post(path,data={})
      response = connection.post(path,data)
      process_response(response,path)
    end

    def put(path,data={})
      response = connection.put(path,data)
      process_response(response,path)
    end

    def process_response(response,path)
      if !response.body
        nil
      elsif response.body['status']
        response.body['result']
      else
        raise Error.new("Status code #{response.body['code']}: #{response.body['result']} for request to '#{path}'")
      end
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
        faraday.request    :json
        faraday.response   :logger
        faraday.adapter    Faraday.default_adapter
      end
    end

  end
end
