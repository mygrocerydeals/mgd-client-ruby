require "spec_helper"
describe "DealController" do
  let(:client) { MyGroceryDeals::DealController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  let(:ids) {
    deals_client = MyGroceryDeals::DealsController.new(
      MyGroceryDeals::Configuration::VERSION,
      MyGroceryDeals::Configuration::X_API_KEY
      )
    results = deals_client.create_deals_search({
      filter: {
        location: { zip: 12007 }
      } })
    [
      results["groups"][0]["results"][0]["id"],
      results["groups"][0]["results"][1]["id"]
    ]
  }
  describe "get_deal_by_id" do
    it 'retrieves the deal' do
      expect(client.get_deal_by_id(ids[0])["id"]).to eq ids[0]
    end
  end

  describe "get_deal_by_ids" do
    it 'retrieves the deals' do
      result = client.get_deal_by_ids(ids.join(','))
      expect(result['results'].map { |deal| deal["id"] }).to match_array ids
    end
  end
end
