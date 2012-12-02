require 'ostruct'

class File
  def archive
    OpenStruct.new name:    File.basename(path),
                   stream:  IO.read(self)
  end
end
