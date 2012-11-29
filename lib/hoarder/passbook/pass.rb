module Hoarder
  module Passbook
    class Pass
      attr_accessor :name

      def to_json
      end

      def file
        PKPassFile.new(self).file
      end
    end
  end
end
