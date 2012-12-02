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
end
