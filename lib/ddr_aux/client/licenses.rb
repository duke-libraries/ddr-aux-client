module DdrAux::Client
  class Licenses

    def self.call(params=nil)
      path = "/licenses"
      if params
        path << "?" + URI.encode_www_form(params)
      end
      Connection.call(path)
    end

  end
end
