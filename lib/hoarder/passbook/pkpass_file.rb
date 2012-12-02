require 'tmpdir'

module Hoarder
  module Passbook
    class PKPassFile
      def initialize(pass)
        raise ArgumentError, "pass cannot be nil" if pass.nil?
        @pass = pass
      end

      def manifest
        @manifest ||= Manifest.new
      end

      def file
        file = temporary_file
        file.write Archiver.new(file_list).stream.string
        file.close
        file
      end

      private

      def temporary_file
        dir = Dir.mktmpdir 'pkpass'
        name = @pass.name || 'pass'
        File.open("#{dir}/#{name}.pkpass", 'w')
      end

      def file_list
        [
          { 'pass.json' => @pass.to_json }
        ]
      end
    end
  end
end
