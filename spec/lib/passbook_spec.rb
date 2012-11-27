require 'spec_helper'

describe Hoarder::Passbook do
  describe 'configure' do
    it 'specifies the base path' do
      Hoarder::Passbook.configure do |config|
        config.base_path = '.'
      end
      Hoarder::Passbook.configuration.base_path.should == '.'
    end
  end
end
