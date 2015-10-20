require "spec_helper"
describe "CategoryController" do
  let(:client) { MyGroceryDeals::CategoryController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY
    )}
    describe "get_category_by_id" do
      it "retrieves the category" do
        id = "35"
        expect(client.get_category_by_id(id)["id"]).to eq id
      end
    end
end
