require 'ostruct'
require 'json'

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

      def to_json
        shas = {}
        @files.delete_if { |file| file.class == self.class }.each do |file|
          stream = file.archive.stream
          unless stream.nil?
            shas[file.archive.name] = Digest::SHA1.hexdigest(stream)
          end
        end
        shas.to_json
      end

      def archive
        OpenStruct.new name:    "manifest.json",
                       stream:  self.to_json
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
