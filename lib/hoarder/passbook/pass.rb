require 'tmpdir'

module Hoarder
  module Passbook
    class Pass
      attr_accessor :name

      def to_json
      end

      def file
        dir = Dir.mktmpdir 'pkpass'
        @name ||= 'pass'
        file = File.open("#{dir}/#{@name}.pkpass", 'w')
        file.write Archiver.new(file_list).stream
        file.close
        file
      end

      private

      def file_list
        [
          { 'pass.json' => to_json }
        ]
      end
    end
  end
end
