module Printful
  class Model

    attr_accessor :data, :options

    def self.attr_accessor(*vars)
      @attr_accessors ||= []
      @attr_accessors.concat vars
      super
    end

    def self.attr_accessors
      @attr_accessors
    end

    def attr_accessors
      self.class.attr_accessors
    end

    def pre_process_data(data)
      data
    end

    def stringify_keys(data)
      data.keys.inject({}) { |memo,key|
        memo[key.to_s] = data[key]; memo
      }
    end

    def set_data(data)
      data = stringify_keys(data)
      pre_processed = pre_process_data(data)
      attr_accessors.each do |key|
        if pre_processed[key.to_s]
          send(:"#{key}=",pre_processed[key.to_s])
        end
      end
    end

    def initialize(data,options={})
      @raw = data
      @options = options
      set_data(data)
    end

    def client
      @client ||= get_client
    end

    def get_client
      return options[:client] if options[:client]
      return Client.new(options) if options[:api_key]
      Printful::Client.default_client
    end

    def self.client
      Printful::Client.default_client
    end

  end
end
