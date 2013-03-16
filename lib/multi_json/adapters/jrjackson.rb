require 'jrjackson_r' unless defined?(::JrJackson)
require 'multi_json/adapters/thick_adapter'

module MultiJson
  module Adapters
    class Jrjackson < ThickAdapter
      ParseError = ::Java::OrgCodehausJackson::JsonParseException

      private

      def load_json(string)
        ::JrJackson::Json.parse(string)
      end

      def dump_json(object)
        ::JrJackson::Json.generate(prepare_object(object))
      end
    end
  end
end