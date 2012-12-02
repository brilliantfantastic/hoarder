require 'spec_helper'

describe Hoarder::Passbook do
  describe 'configure' do
    it 'specifies the base path' do
      Hoarder::Passbook.configure do |config|
        config.base_path = 'some/path'
      end
      Hoarder::Passbook.configuration.base_path.should == 'some/path'
    end
  end
end
