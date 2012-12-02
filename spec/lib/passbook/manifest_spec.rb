require 'spec_helper'

describe Hoarder::Passbook::Manifest do
  subject { Hoarder::Passbook::Manifest.new }
  describe "<<" do
    it "adds a file" do
      subject << "test.txt"
      subject.files.should include "test.txt"
    end
  end

  describe ".remove" do
    it "removes the file" do
      subject << "test.txt"
      subject.remove "test.txt"
      subject.files.should_not include "test.txt"
    end

    it "can handle files not in the array" do
      subject.remove "blah"
      subject.files.should_not include "blah"
    end
  end

  describe ".initialize" do
    let (:config) { Hoarder::Passbook.configuration }
    it "automatically adds icon file from the configuration" do
      subject.files.should include config.icon
    end

    it "automatically adds icon 2x file from the configuration" do
      subject.files.should include config.icon_2x
    end

    it "automatically adds logo file from the configuration" do
      subject.files.should include config.logo
    end

    it "automatically adds logo 2x file from the configuration" do
      subject.files.should include config.logo_2x
    end

  end
end
