require "spec_helper"
describe "ChainController" do
  let(:client) { MyGroceryDeals::ChainController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  describe "get_chain_by_id" do
    it "retrieve the chain" do
      expect(client.get_chain_by_id('44')['status']).to eq "SUCCESS"
    end
  end
end
