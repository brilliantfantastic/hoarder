require_relative 'passbook/configuration'
require_relative 'passbook/archiver'
require_relative 'passbook/pkpass_file'
require_relative 'passbook/pass'

module Hoarder
  module Passbook
    def self.configuration
      @configuration ||= Hoarder::Passbook::Configuration.new
    end

    def self.configure
      yield configuration if block_given?
    end
  end
end
