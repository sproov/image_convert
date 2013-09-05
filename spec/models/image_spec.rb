require 'spec_helper'

describe Image do

  before { @image = FactoryGirl.build(:image, dimensions: [{ width: 50, height: 50}, {width: 100, height: 150}]) }

  subject{ @image }

  it { should be_valid }

  it "should serialize a set of dimensions" do
    dimensions = @image.dimensions
    @image.save
    @image.dimensions.should == dimensions
  end

  it "should create the correct set of images" do
    @image.save
    @image.asset.styles.count.should == 2
  end

  describe "styles" do
    it "should return the correct representation of styles" do
      @image.styles.should == {:"50x50"=>"50x50", :"100x150"=>"100x150"}
    end
  end

  describe "processed" do
    before do
      @processed_1 = FactoryGirl.create(:image, processed: true)
      @processed_2 = FactoryGirl.create(:image, processed: true)
      @unprocessed = FactoryGirl.create(:image, processed: false)
    end

    it "should only return processed images" do
      images = Image.processed
      images.size.should == 2
      images.include?(@processed_1).should be_true
      images.include?(@unprocessed).should be_false
    end
  end

  describe "by_external_id" do
    before { @image = FactoryGirl.create(:image, external_id: 123) }

    it "should correctly return an image by external_id" do
      result = Image.by_external_id(123)
      result.should == @image
    end

    it "should return nil for an unknown external_id" do
      result = Image.by_external_id(666)
      result.should be_nil
    end
  end

end