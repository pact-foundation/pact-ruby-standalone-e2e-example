module Pact
  module Consumer
    module RackRequestHelper

      alias_method :old_standardise_header, :standardise_header

      def standardise_header header
        if header == 'HTTP_ACCESS_TOKEN'
          header.gsub(/^HTTP_/, '').downcase
        else
          old_standardise_header(header)
        end
      end
    end
  end
end
