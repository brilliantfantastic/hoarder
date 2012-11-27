require_relative 'passbook/configuration'

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
