namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    100.times do |n|
      Charity.create!(name: "Sample Charity #{n+1}",
                      url: "http://sample-charity-#{n+1}.org")
      Merchant.create!(name: "Sample Merchant #{n+1}",
                       url: "http://sample-merchant-#{n+1}.com")
    end
  end
end
