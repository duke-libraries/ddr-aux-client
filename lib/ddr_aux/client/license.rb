module DdrAux::Client
  class License

    def self.call(id)
      Connection.call("/licenses/#{id}")
    end

  end
end
