module Configuration
  def configure
    Hoarder::Passbook.configure do |config|
      config.base_path = File.expand_path "../data", __FILE__
    end
  end
end
