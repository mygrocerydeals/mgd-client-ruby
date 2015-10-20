require "spec_helper"
describe "GeoController" do
  let(:client) { MyGroceryDeals::GeoController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  describe 'get_geo_ip_by_ip' do
    it 'geo locates by ip' do
      expect(client.get_geo_ip_by_ip('8.8.8.8')["status"]).to eq "SUCCESS"
    end
  end
end
