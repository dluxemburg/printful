require 'spec_helper'

unless PrintfulTest.printful_key.nil?

  WebMock.allow_net_connect!

  describe Printful::Client do

    subject do
      Printful::Client.new(api_key:PrintfulTest.printful_key)
    end

    it "should get products" do
      response = subject.get('products/').body

      expect(response.keys).to eq(['status','code','result'])

      products = response['result']

      expect(products).to be_a(Array)
      expect(products.first['id']).to eq("1")
      expect(products[6]['name']).to eq("Canvas")

    end

  end

end
