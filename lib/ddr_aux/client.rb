require "ddr_aux/client/version"
require "ddr_aux/client/connection"
require "ddr_aux/client/api"

module DdrAux
  module Client
    extend Api

    class << self
      attr_accessor :api_url
    end

    self.api_url = ENV["DDR_AUX_API_URL"]

  end
end
