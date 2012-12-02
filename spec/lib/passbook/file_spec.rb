require 'spec_helper'

describe File do
  describe ".archive" do
    subject { Tempfile.new 'foo' }
    after(:all) { subject.close! }
    it "responds to name" do
      subject.archive.name.should == File.basename(subject)
    end

    it "responds to stream" do
      subject.archive.stream.should == IO.read(subject)
    end
  end
end
