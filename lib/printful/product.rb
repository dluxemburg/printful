module Printful
  class Product < Model

    attr_accessor :id, :type, :name, :size, :price, :model, :brand, :color

    def pre_process_data(data)
      data['price'] = data['price'].to_f
      data
    end

    def self.all
      client.get('products').map { |raw| new(raw) }
    end

  end
end
