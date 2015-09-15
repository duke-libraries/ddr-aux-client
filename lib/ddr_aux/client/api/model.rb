require "uri"

module DdrAux::Client
  module Api
    class Model

      class << self
        attr_accessor :path

        def get(id)
          Connection.call [path, id].join("/")
        end

        def list
          Connection.call path
        end
        alias_method :all, :list

        def find(**args)
          Connection.call "#{path}/find?%s" % URI.encode_www_form(args)
        end
      end

    end
  end
end
