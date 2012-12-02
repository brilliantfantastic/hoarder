require 'spec_helper'

describe Hoarder::Passbook::Manifest do
  let (:config) { Hoarder::Passbook.configuration }
  before(:each) { configure }
  subject { Hoarder::Passbook::Manifest.new }

  context "including a temporary file" do
    let(:file) { Tempfile.new "test" }
    after(:all) { file.close! }
    describe "<<" do
      it "adds a file" do
        subject << file
        subject.files.should include file
      end
    end

    describe ".remove" do
      it "removes the file" do
        subject << file
        subject.remove file
        subject.files.should_not include file
      end

      it "can handle files not in the array" do
        subject.remove file
        subject.files.should_not include file
      end
    end
  end

  describe ".initialize" do
    it "automatically adds icon file from the configuration" do
      names(subject.files).should include config.icon
    end

    it "automatically adds icon 2x file from the configuration" do
      names(subject.files).should include config.icon_2x
    end

    it "automatically adds logo file from the configuration" do
      names(subject.files).should include config.logo
    end

    it "automatically adds logo 2x file from the configuration" do
      names(subject.files).should include config.logo_2x
    end
  end
end
