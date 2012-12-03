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

  describe ".archive" do
    it "sets the name to manifest.json" do
      subject.archive.name.should == "manifest.json"
    end

    it "sets the stream to the json" do
      subject.stub(:to_json => "hello: world")
      subject.archive.stream.should == subject.to_json
    end
  end

  describe ".to_json" do
    it "creates a key for each file" do
      hash = JSON.parse subject.to_json
      hash.keys.should include config.icon
      hash.keys.should include config.icon_2x
      hash.keys.should include config.logo
      hash.keys.should include config.logo_2x
    end

    it "should not include the manifest file itself" do
      subject << subject
      hash = JSON.parse subject.to_json
      hash.keys.should_not include "manifest.json"
    end

    it "should not include files that have null streams" do
      pass = Hoarder::Passbook::Pass.new
      pass.stub(:to_json => nil)
      subject << pass
      hash = JSON.parse subject.to_json
      hash.keys.should_not include pass.archive.name
    end

    it "creates a sha for each file" do
      subject.to_json[config.icon].should_not be_nil
      subject.to_json[config.icon_2x].should_not be_nil
      subject.to_json[config.logo].should_not be_nil
      subject.to_json[config.logo_2x].should_not be_nil
    end
  end
end
