require 'zip/zip'

module Hoarder
  module Passbook
    class Archiver
      def initialize(entries)
        @entries = entries
      end

      def stream
        Zip::ZipOutputStream.write_buffer do |zip|
          @entries.each do |entry|
            zip.put_next_entry entry.archive.name
            zip.write entry.archive.stream
          end
        end
      end
    end
  end
end
