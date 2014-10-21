require 'spec_helper'

describe Hoarder::Passbook::Signature do
  let(:manifest) { {}.to_json }
  subject { Hoarder::Passbook::Signature.new manifest }
  describe ".data" do
    it "should return a base encoded string" do
      subject.stub(:signed_certificate => "filename=\"smime.p7s\"\n\n------")
      subject.data.should_not be_nil
    end
  end
end
