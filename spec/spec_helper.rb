require './lib/hoarder'

require_relative 'zipper'
require_relative 'configuration'
require_relative 'file_helper'

RSpec.configure do |config|
  config.include Zipper
  config.include Configuration
  config.include FileHelper
end
