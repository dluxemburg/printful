module Printful
  class Model

    def intialize(data,client)
      @client = client
    end

    def client
      @client ||= Printful.default_client
    end

  end
end
