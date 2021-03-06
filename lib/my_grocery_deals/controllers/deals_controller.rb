# This file was automatically generated by APIMATIC BETA v2.0 on 10/09/2015

module MyGroceryDeals
  class DealsController

    # Initializer with authentication and configuration parameters
    def initialize(version, x_api_key)
        @version = version;
        @x_api_key = x_api_key;
    end

    # return count of active deals
    # @return DealsCountResponse response from the API call
    def get_deals_count
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/deals/count"

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "APIMATIC 2.0",
        "accept" => "application/json",
        "X-Api-Key" => @x_api_key
      }

      # invoke the API call request to fetch the response
      response = Unirest.get query_url, headers:headers

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

    # Search for deals based on a query specification. This is really the heart
    # of the API. It is intended to cover the vast majority of integration
    # scenarios. Most of the other operations exist only to support search.
    # @param [mixed] body Required parameter: TODO: type description here
    # @param [Numeric] from Optional parameter: Number of the first result to show (0-based)
    # @param [Numeric] size Optional parameter: Count of results to be included in the response
    # @return mixed response from the API call
    def create_deals_search body, from: nil, size: nil
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/deals/search"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_query_parameters query_builder, {
        "from" => from,
        "size" => size,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "APIMATIC 2.0",
        "accept" => "application/json",
        "content-type" => "application/json; charset=utf-8",
        "X-Api-Key" => @x_api_key
      }

      # invoke the API call request to fetch the response
      response = Unirest.post query_url, headers:headers, parameters:body.to_json

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

  end
end