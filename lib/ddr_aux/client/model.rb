require "uri"
require "hashie"
require "delegate"
require "time"

module DdrAux::Client
  # @abstract
  class Model < Hashie::Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::MethodReader
    include Hashie::Extensions::Coercion

    DEFAULT_TIMESTAMPS = [:created_at, :updated_at].freeze

    class << self

      attr_accessor :path
      private :path=

      def coerce_timestamps!(*keys)
        if keys.empty?
          keys = DEFAULT_TIMESTAMPS
        end
        coerce_keys *keys, ->(v) { ::Time.parse(v) }
      end

      def get(id)
        request_path = [path, id].join("/")
        response = Request.get_response(request_path)
        new response.to_h
      end

      def list
        response = Request.get_response(path)
        response.map { |record| new(record) }
      end
      alias_method :all, :list

      def find(**args)
        request_path = "#{path}/find?%s" % URI.encode_www_form(args)
        response = Request.get_response(request_path)
        new response.to_h
      end
      alias_method :where, :find
    end

  end
end
