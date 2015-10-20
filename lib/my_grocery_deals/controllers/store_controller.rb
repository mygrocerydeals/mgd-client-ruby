# This file was automatically generated by APIMATIC BETA v2.0 on 10/09/2015

module MyGroceryDeals
  class StoreController

    # Initializer with authentication and configuration parameters
    def initialize(version, x_api_key)
        @version = version;
        @x_api_key = x_api_key;
    end

    # Return one or more stores by their identifiers
    # @param [String] ids Required parameter: TODO: type description here
    # @return void response from the API call
    def get_store_by_ids ids
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/store/{ids}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "ids" => ids,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "APIMATIC 2.0",
        "X-Api-Key" => @x_api_key
      }

      # invoke the API call request to fetch the response
      response = Unirest.get query_url, headers:headers

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end
    end

  end
end