require "net/http"
require "delegate"

module DdrAux::Client
  class Connection < SimpleDelegator

    def self.call(*args)
      new.get_response(*args)
    end

    def initialize
      uri = DdrAux::Client.uri
      super Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == "https"
        self.use_ssl = true
        self.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def get_response(relative_path)
      warn "[DEPRECATION] `get_response` is deprecated and will be removed from ddr-aux-client 2.0." \
           " Use `DdrAux::Client::Request.get_response` instead."
      Request.get_response(relative_path)
    end

  end
end
