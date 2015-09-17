require "json"
require "delegate"

module DdrAux::Client
  class Response < SimpleDelegator

    def initialize(response)
      response.value # raises exception if not 2XX response code
      super JSON.parse(response.body)
    end

  end
end
