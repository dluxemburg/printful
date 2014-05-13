require 'spec_helper'

unless PrintfulTest.printful_key.nil?

  describe Printful::Client do

    before do
      WebMock.allow_net_connect!
      Printful.api_key = PrintfulTest.printful_key
    end

    context '.create' do

      # it "should place an order" do
      #   order = Printful::Order.create({
      #     'id'    => 10,
      #     'notes'     => 'Some notes',
      #     'handling'  => 'STANDARD',
      #     'recipient' => {
      #       'fullName'  => 'Vadims Moisejenko',
      #       'address1'  => '172 W Providencia Ave',
      #       'address2'  => '#105',
      #       'city'      => 'Burbank',
      #       'state'     => 'CA',
      #       'country'   => 'US',
      #       'zip'       => '91502'
      #     },
      #     'items'     => [
      #       {
      #         'product'   => 2,
      #         'sku'       => 15,
      #         'name'      => 'API Poster',
      #         'imageUrl'  => 'http://i.behappy.me/downloads/558/printfile_33_mposter.jpg',
      #         'quantity'  => 1
      #       }
      #     ]
      #   })

      # end

    end


    context '.update' do

      it "should place an order" do
        order = Printful::Order.update({
          'id'    => 10,
          'notes'     => 'Some notes',
          'handling'  => 'STANDARD',
          'recipient' => {
            'fullName'  => 'Daniel Luxemburg',
            'address1'  => '172 W Providencia Ave',
            'address2'  => '#105',
            'city'      => 'Burbank',
            'state'     => 'CA',
            'country'   => 'US',
            'zip'       => '91502'
          },
          'items'     => [
            {
              'product'   => 2,
              'sku'       => 15,
              'name'      => 'API Poster Part 2',
              'imageUrl'  => 'http://i.behappy.me/downloads/558/printfile_33_mposter.jpg',
              'quantity'  => 1
            }
          ]
        })
        # binding.pry
      end

    end


    # context '#save' do

    #   it "should update the order" do
    #     name = rand(9999999).to_s(36)
    #     notes = Time.now.to_s
    #     order = Printful::Order.find(10)

    #     # order.recipient['name'] = name
    #     order.notes = notes
    #     binding.pry
    #     order.save
    #     binding.pry
    #   end

    # end

    context '.find' do

      it "should get an order record" do
        order = Printful::Order.find(10)
        # binding.pry
      end

    end

  end

end
