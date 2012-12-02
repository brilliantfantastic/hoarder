require 'spec_helper'

describe Hoarder::Passbook::Archiver do
  describe '.stream' do
    let(:file) { Tempfile.new 'foo' }
    after(:all) { file.close! }

    subject do
      Hoarder::Passbook::Archiver.new [file]
    end
    it 'should create zipped stream' do
      subject.stream.size.should > 0
    end
  end
end
