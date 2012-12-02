module Hoarder
  module Passbook
    class Manifest
      attr_accessor :files

      def initialize
        @files = []
        add_config_files
      end

      def <<(file)
        @files << file
      end

      def remove(file)
        @files.delete file
      end

      private

      def add_config_files
        Hoarder::Passbook.configuration.files.each do |file|
          @files << file
        end
      end
    end
  end
end
