module DdrAux::Client
  class Request

    attr_reader :connection, :path

    def self.get_response(path)
      new(path).get_response
    end

    def initialize(path)
      @path = path
      @connection = Connection.new
    end

    def get_response
      request_path = DdrAux::Client.uri.path + path
      http_res = connection.get(request_path, request_headers)
      Response.new http_res
    end

    private

    def request_headers
      {"Accept"=>"application/json"}
    end

  end
end
