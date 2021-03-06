# This file was automatically generated by APIMATIC BETA v2.0 on 10/09/2015

module MyGroceryDeals
  class GeoController

    # Initializer with authentication and configuration parameters
    def initialize(version, x_api_key)
        @version = version;
        @x_api_key = x_api_key;
    end

    # Return location information about the specified IP address
    # @param [String] ip Required parameter: IP address to be looked up
    # @return GeoIpResponse response from the API call
    def get_geo_ip_by_ip ip
      # the base uri for api requests
      query_builder = Configuration::BASE_URI.dup % [@version]

      # prepare query string for API call
      query_builder << "/geo/ip/{ip}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "ip" => ip,
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