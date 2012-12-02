module FileHelper
  def names(files)
    files.map {|file| File.basename(file)}
  end
end
