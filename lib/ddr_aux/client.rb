require "ddr_aux/client/version"

module DdrAux
  module Client

    autoload :AdminSet,   "ddr_aux/client/admin_set"
    autoload :Api,        "ddr_aux/client/api"
    autoload :Connection, "ddr_aux/client/connection"
    autoload :Error,      "ddr_aux/client/error"
    autoload :License,    "ddr_aux/client/license"
    autoload :Model,      "ddr_aux/client/model"
    autoload :Request,    "ddr_aux/client/request"
    autoload :Response,   "ddr_aux/client/response"

    class << self
      attr_accessor :api_url

      def url
        api_url || ENV["DDR_AUX_API_URL"] || error("DdrAux::Client API URL is not configured.")
      end

      def uri
        URI(url)
      end

      def error(message)
        raise Error, message
      end
    end

    extend Api
  end
end
