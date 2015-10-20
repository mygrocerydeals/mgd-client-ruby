require "spec_helper"
describe "StoresController" do
  let(:client) { MyGroceryDeals::StoresController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  describe "get_stores_nearby by" do
    it "ip" do
      expect(client.get_stores_nearby(ip: "8.8.8.8")["status"]).to eq "SUCCESS"
    end

    it 'zip' do
      expect(client.get_stores_nearby(zip: "12345")["status"]).to eq "SUCCESS"
    end

    it "latitude and longitude" do
      expect(client.get_stores_nearby(latitude: 37.386, longitude: -122.0838)["status"]).to eq "SUCCESS"
    end
  end

end
