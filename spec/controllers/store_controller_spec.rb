require "spec_helper"
describe "StoreController" do
  let(:client) { MyGroceryDeals::StoreController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  describe "get_store_by_ids" do
    it "retrieve 1 store" do
      expect(client.get_store_by_ids('2000038305')['id']).to eq "2000038305"
    end
    it "retrieves more than 1 store" do
      expect(client.get_store_by_ids('2000038305,1000099653')['status']).to eq "SUCCESS"
    end
  end
end
