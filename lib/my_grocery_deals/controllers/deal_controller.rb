# This file was automatically generated by APIMATIC BETA v2.0 on 10/09/2015

module MyGroceryDeals
  class DealController

    # Initializer with authentication and configuration parameters
    def initialize(version, x_api_key)
        @version = version;
        @x_api_key = x_api_key;
    end

    # return a list of similar deals to the one specified
    # @param [Numeric] id Required parameter: TODO: type description here
    # @param [String] distance Optional parameter: Radius to search
    # @param [String] ip Optional parameter: End user's ip address
    # @param [Numeric] latitude Optional parameter: End user's latitude
    # @param [Numeric] longitude Optional parameter: End user's longitude
    # @param [String] zip Optional parameter: End user's zip code
    # @return DealRelatedResponse response from the API call
    def get_deal_related_by_id id, distance: nil, ip: nil, latitude: nil, longitude: nil, zip: nil
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/deal/{id}/related"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "id" => id,
      }

      # process optional query parameters
      query_builder = APIHelper.append_url_with_query_parameters query_builder, {
        "distance" => distance,
        "ip" => ip,
        "latitude" => latitude,
        "longitude" => longitude,
        "zip" => zip,
      }

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

    # lookup a specific deal by identifier
    # @param [Numeric] id Required parameter: TODO: type description here
    # @return DealEntity response from the API call
    def get_deal_by_id id
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/deal/{id}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "id" => id,
      }

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

      # Error handling using HTTP status codes
      if response.code == 404
        raise APIException.new "*Error* The specified deal does not exist. It may have existed at one point
and expired.
", 404, response.raw_body
      elsif !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

    # Return multiple deals by their identifiers. If you are retrieving a long list of deals, use the search operation instead with an id filter.
    # @param [String] ids Required parameter: TODO: type description here
    # @return DealResponse response from the API call
    def get_deal_by_ids ids
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/deal/{ids}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "ids" => ids,
      }

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

  end
end