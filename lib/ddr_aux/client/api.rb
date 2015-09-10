module DdrAux::Client
  module Api

    def license(arg)
      if arg.respond_to?(:to_h)
        find_license(**(arg.to_h))
      else
        get_license(arg)
      end
    end

    def get_license(id)
      require_relative "api/get_license"
      GetLicense.call(id)
    end

    def get_licenses
      require_relative "api/get_licenses"
      GetLicenses.call
    end
    alias_method :licenses, :get_licenses

    def find_license(**args)
      require_relative "api/find_license"
      FindLicense.call(**args)
    end

  end
end
