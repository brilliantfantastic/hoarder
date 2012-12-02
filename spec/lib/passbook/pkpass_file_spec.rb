require 'spec_helper'

describe Hoarder::Passbook::PKPassFile do
  let(:pass) { Hoarder::Passbook::Pass.new }
  subject { Hoarder::Passbook::PKPassFile.new(pass) }

  describe '.initialize' do
    it 'requires a pass' do
      expect { Hoarder::Passbook::PKPassFile.new(nil) }.to raise_error(ArgumentError)
    end
  end

  describe '.file' do
    before(:all) { configure }
    after(:each) { File.delete subject.file.path }

    it 'creates a pkpass archive' do
      File.extname(subject.file.path).should == ".pkpass"
    end

    it 'has a file name of pass by default' do
      File.basename(subject.file.path, '.pkpass').should == "pass"
    end

    it 'has a file name from name by default' do
      pass.name = 'Jimmy Page'
      File.basename(subject.file.path, '.pkpass').should == "Jimmy Page"
    end

    it 'contains a pass json file' do
      unzipped(subject.file).should include 'pass.json'
    end

    it 'contains a manifest json file' do
      unzipped(subject.file).should include 'manifest.json'
    end
  end
end
