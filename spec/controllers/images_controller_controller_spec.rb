require 'spec_helper'

describe ImagesController do



  describe "#index" do
    before { get :index }

    it "should return index" do
      response.should be_success
      response.body.should == "index"
    end

  end

  describe "#show" do
    before do
      @image = FactoryGirl.create(:image)
      get :index, id: 1
    end

    it "should return show" do
      response.body.should == "index"
    end

  end

  describe "create" do
    before { post :create, { image: { url: 'http://www.test.com/image/1' } } }

    it "should create a new image" do
      Image.count.should == 1
    end
  end

end
