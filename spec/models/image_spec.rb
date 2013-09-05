require 'spec_helper'

describe Image do

  before { @image = FactoryGirl.build(:image) }

  subject{ @image }

  it { should be_valid }

  it "should serialize a set of dimensions" do
    image = Image.new
    dimensions = [{ width: 50, height: 50}, {width: 100, height: 150}]
    image.save
    image.dimensions.should == dimensions
  end

end