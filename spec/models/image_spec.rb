require 'spec_helper'

describe Image do

  before { @image = Factory.build(:image) }

  subject{ @image }

  it { should be_valid }

  it "should parse and serialize dimensions" do
    image = Image.new
    dimensions = [{ width: 50, height: 50}, {width: 100, height: 150}]
    image.save
    # image.dimeions
  end

end