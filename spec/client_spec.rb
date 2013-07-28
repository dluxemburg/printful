require 'spec_helper'

unless PrintfulTest.printful_key.nil?

  describe Printful::Client do

    before do
      WebMock.allow_net_connect!
    end

    subject do
      Printful::Client.new(api_key:PrintfulTest.printful_key)
    end

    it "should get products" do
      products = subject.get('products')
      expect(products).to be_a(Array)
      expect(products.first['id']).to eq("1")
      expect(products[6]['name']).to eq("Canvas")
    end

  end

end
