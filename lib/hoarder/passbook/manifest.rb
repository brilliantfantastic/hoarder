module Hoarder
  module Passbook
    class Manifest
      attr_accessor :files

      def initialize
        @files = []
      end

      def <<(file)
        @files << file
      end

      def remove(file)
        @files.delete file
      end
    end
  end
end
