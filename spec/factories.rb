FactoryGirl.define do

  factory :image do
    url 'http://www.test.com/image'
    asset File.new(Rails.root + 'spec/assets/images/rails.png')
    dimensions [[120, 150], [50,50]]
  end

end