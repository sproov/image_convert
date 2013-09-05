FactoryGirl.define do

  factory :image do
    sequence(:external_id) { |n| n }
    producer_id 1
    url 'http://www.test.com/image'
    asset File.new(Rails.root + 'spec/assets/images/rails.png')
    dimensions [{ width: 50, height: 50}, {width: 100, height: 150}]
  end

end