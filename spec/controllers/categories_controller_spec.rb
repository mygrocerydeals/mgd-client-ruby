require "spec_helper"
describe "DealsController" do
  let(:client) { MyGroceryDeals::CategoriesController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
  describe "get_categories_major" do
      it 'retrieves the categoires' do
        expect(client.get_categories_major["status"]).to eq "SUCCESS"
      end
  end
  describe "get_categories" do
      it 'retrieves the categoires' do
        expect(client.get_categories["status"]).to eq "SUCCESS"
      end
  end

end
