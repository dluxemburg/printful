module Printful
  class Order < Model

    attr_accessor :notes, :handling, :recipient, :items, :id, :status

    def self.create(data)
      order = new(data)
      order.save_new
      order
    end

    def self.update(data)
      order = new(data)
      order.save
      order
    end

    def self.find(id)
      order = new({id:id})
      order.refresh
      order
    end

    def payload
      {
        notes: notes,
        handling: handling,
        recipient: recipient.to_h,
        items: items
      }
    end

    def save_new
      data = payload.merge(number: id)
      result = client.post('orders',data)
      set_data(result)
    end

    def refresh
      result = client.get("orders/#{id}")
      set_data(result)
      result
    end

    def save
      client.put("orders/#{id}",payload)
      refresh
    end


  end

end
