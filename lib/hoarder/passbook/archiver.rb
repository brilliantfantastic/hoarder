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
            entry.each do |k,v|
              zip.put_next_entry k
              zip.write v
            end
          end
        end
      end
    end
  end
end
