require 'spec_helper'

describe Hoarder::Passbook::Pass do
  subject { Hoarder::Passbook::Pass.new }
  describe '.file' do
    it 'creates a pkpass archive' do
      File.extname(subject.file.path).should == ".pkpass"
    end

    it 'has a file name of pass by default' do
      File.basename(subject.file.path, '.pkpass').should == "pass"
    end

    it 'has a file name from name by default' do
      subject.name = 'Jimmy Page'
      File.basename(subject.file.path, '.pkpass').should == "Jimmy Page"
    end

    it 'contains a json file' do
      unzipped(subject.file).should include 'pass.json'
    end
  end
end
