require "ddr_aux/client/version"

module DdrAux
  module Client
    autoload :AdminSet,   "ddr_aux/client/admin_set"
    autoload :Api,        "ddr_aux/client/api"
    autoload :Connection, "ddr_aux/client/connection"
    autoload :Contact,    "ddr_aux/client/contact"
    autoload :License,    "ddr_aux/client/license"
    autoload :Model,      "ddr_aux/client/model"
    autoload :Request,    "ddr_aux/client/request"
    autoload :Response,   "ddr_aux/client/response"

    class << self
      attr_accessor :api_url

      def uri
        URI(api_url)
      end
    end

    self.api_url = ENV["DDR_AUX_API_URL"]

    extend Api
  end
end
