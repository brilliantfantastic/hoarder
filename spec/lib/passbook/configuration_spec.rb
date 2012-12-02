require 'spec_helper'

describe Hoarder::Passbook::Configuration do
  subject { Hoarder::Passbook::Configuration.new }
  describe ".initialize" do
    it "defaults base_path to ." do
      subject.base_path.should == '.'
    end

    it "defaults logo to logo.png" do
      subject.logo.should == 'logo.png'
    end

    it "defaults logo_2x to logo@2x.png" do
      subject.logo_2x.should == 'logo@2x.png'
    end

    it "defaults icon to icon.png" do
      subject.icon.should == 'icon.png'
    end

    it "defaults icon_2x to icon@2x.png" do
      subject.icon_2x.should == 'icon@2x.png'
    end
  end

  describe '.files' do
    it 'contains all the files from the configuration' do
      subject.files.should == [subject.logo, subject.logo_2x,
                               subject.icon, subject.icon_2x]
    end
  end
end
