namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    Charity.create!(name: "Youth Orchestras of Essex County",
                    url: "http://yoec.org")

    Merchant.create!(name: "Flower.com",
                     link: "http://click.linksynergy.com/fs-bin/click?id=vzTM3hghpIE&offerid=102910.10000002&type=4&subid=0",
                     img_url: "http://lsh.flower.com/img/lsh/88x31-01.gif",
                     img_alt: "Flower.com",
                     tracking_img: "http://ad.linksynergy.com/fs-bin/show?id=vzTM3hghpIE&bids=102910.10000002&type=4&subid=0",
                     percentage: 10)

    100.times do |n|

      Charity.create!(name: "Sample Charity #{n+1}",
                      url: "http://sample-charity-#{n+1}.org")

      Merchant.create!(name: "Sample Merchant #{n+1}",
                       link: "http://sample-merchant-#{n+1}.com",
                       img_url: "http://stevesaporta.com/sample_charity_logo.png",
                       img_alt: "Sample Merchant #{n+1}",
                       tracking_img: "http://stevesaporta.com/sample_charity_logo.png",
                       percentage: ((n+1)/10))
    end
  end
end
