require 'net/http'
require 'json'

module DdrAux::Client
  class Connection < SimpleDelegator

    def self.call(*args)
      new.get_response(*args)
    end

    def initialize
      conn = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == "https"
        conn.use_ssl = true
        conn.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      super conn
    end

    def get_response(relative_path)
      path = uri.path + relative_path
      res = get(path, request_headers)
      res.value # raises exception if not 2XX response code
      JSON.parse(res.body)
    end

    private

    def uri
      URI(DdrAux::Client.api_url)
    end

    def request_headers
      {"Accept"=>"application/json"}
    end

  end
end
