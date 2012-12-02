require 'tmpdir'

module Hoarder
  module Passbook
    class PKPassFile
      def initialize(pass)
        raise ArgumentError, "pass cannot be nil" if pass.nil?
        @pass = pass
      end

      def manifest
        @manifest ||= create_manifest
      end

      def file
        file = temporary_file
        file.write Archiver.new(manifest.files).stream.string
        file.close
        file
      end

      private

      def temporary_file
        dir = Dir.mktmpdir 'pkpass'
        name = @pass.name || 'pass'
        File.open("#{dir}/#{name}.pkpass", 'w')
      end

      def create_manifest
        m = Manifest.new
        m << @pass
        m << m
        m
      end
    end
  end
end
