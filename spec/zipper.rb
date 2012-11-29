require 'zip/zip'

module Zipper
  def unzipped(file)
    files = []
    zip = Zip::ZipFile.new file.path
    zip.each_with_index do |entry, index|
      files << entry.name
    end
    files
  end
end
