module DdrAux::Client
  class GetLicense

    def self.call(id)
      Connection.call("/licenses/#{id}")
    end

  end
end
