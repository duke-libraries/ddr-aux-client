module DdrAux::Client
  class FindLicense

    def self.call(**args)
      path = "/licenses/find?" + URI.encode_www_form(args)
      Connection.call(path)
    end

  end
end
