require 'spec_helper'

describe Hoarder::Passbook::Pass do
  subject { Hoarder::Passbook::Pass.new }
  describe ".archive" do
    it "sets the name to pass.json" do
      subject.archive.name.should == "pass.json"
    end

    it "sets the stream to the json" do
      subject.stub(:to_json => "hello: world" )
      subject.archive.stream.should == subject.to_json
    end
  end
end
