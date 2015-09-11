module DdrAux::Client
  class GetLicenses

    def self.call
      Connection.call("/licenses")
    end

  end
end
