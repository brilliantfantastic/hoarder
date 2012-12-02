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
        base_path = Hoarder::Passbook.configuration.base_path
        Hoarder::Passbook.configuration.files.each do |file|
          @files << File.new(File.join(base_path, file))
        end
      end
    end
  end
end
