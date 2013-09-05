FactoryGirl.define do

  factory :image do
    url 'http://www.test.com/image'
    asset File.new(Rails.root + 'spec/assets/images/rails.png')
    dimensions [{ width: 50, height: 50}, {width: 100, height: 150}]
  end

end