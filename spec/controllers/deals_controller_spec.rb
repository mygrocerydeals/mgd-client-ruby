require "spec_helper"
describe "DealsController" do
  let(:client) { MyGroceryDeals::DealsController.new(
    MyGroceryDeals::Configuration::VERSION,
    MyGroceryDeals::Configuration::X_API_KEY,
    )}
  describe "get_deals_count" do
    it 'returns the deals count' do
      expect(client.get_deals_count["count"]).to be > 0;
    end
  end

  describe "create_deals_search"  do
    def check_for_success(results)
      expect(results['status']).to eq "SUCCESS"
      expect(results['count']).to be > 0
    end
    describe "location filtering by" do
      it 'zip' do
        results = client.create_deals_search({
          filter: {
            location: { zip: 12007 }
          } })
        check_for_success results
        expect(results['location']['latitude']).to be_between(42.45, 42.46).inclusive
        expect(results['location']['longitude']).to be_between(-73.93, -73.92).inclusive
      end
      it 'ip address' do
        results = client.create_deals_search({
          filter: {
            location: { ip: '8.8.8.8' }
          } });
          check_for_success results
          expect(results['location']['latitude']).to be_between(37.38, 37.39).inclusive
          expect(results['location']['longitude']).to be_between(-122.084, -122.083).inclusive
      end

      it 'lat and long' do
        results = client.create_deals_search({
          filter: {
            location: {
              latitude: 42.4561,
              longitude: -73.9277
             }
          } });
          check_for_success results
          expect(results['location']['latitude']).to equal 42.4561
          expect(results['location']['longitude']).to equal -73.9277
      end
    end
    describe "ingredient" do

      it 'with single ingredient' do
        results = client.create_deals_search({
          filter: {
            location: { zip: 12007 }
          },
          ingredients: 'beer'
          })
        check_for_success results
      end

      it 'with multiple ingredients' do
        results = client.create_deals_search({
          filter: {
            location: { zip: 12007 }
          },
          ingredients: ['beer', 'bread']
          })
        check_for_success results
      end
    end
  end
end
