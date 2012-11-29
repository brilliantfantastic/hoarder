require 'spec_helper'

describe Hoarder::Passbook::Archiver do
  describe '.stream' do
    subject do
      Hoarder::Passbook::Archiver.new [{'first' => '1st'}, {'second' => '2nd'}]
    end
    it 'should create zipped stream' do
      subject.stream.size.should > 0
    end
  end
end
