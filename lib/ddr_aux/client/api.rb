module DdrAux::Client
  module Api

    def license(id)
      require_relative "license"
      License.call(id)
    end

    def licenses(params=nil)
      require_relative "licenses"
      Licenses.call(params)
    end

  end
end
