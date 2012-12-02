require 'ostruct'

module Hoarder
  module Passbook
    class Pass
      attr_accessor :name

      def archive
        OpenStruct.new name:    "pass.json",
                       stream:  self.to_json
      end

      def to_json
      end
    end
  end
end
