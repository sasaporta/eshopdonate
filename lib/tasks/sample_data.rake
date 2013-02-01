namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Charity.create!(name: "Youth Orchestras of Essex County",
                    url: "http://yoec.org",
                    amazon_tracking_id: "esd-yoec-20",
                    shortname: "yoec")

    Merchant.create!(name: "Buy.com",
                     link: "http://affiliate.buy.com/fs-bin/click?id=vzTM3hghpIE&offerid=272843.10000244&type=4&subid=0",
                     img_url: "http://ak.buy.com/buy_assets/affiliate/01/88x31_buylogo_black.gif",
                     img_alt: "Buy.com",
                     tracking_img: "http://ad.linksynergy.com/fs-bin/show?id=vzTM3hghpIE&bids=272843.10000244&type=4&subid=0",
                     percentage: 0.5)

    50.times do |n|
      Charity.create!(name: "Sample Charity #{n+1}",
                      url: "http://sample-charity-#{n+1}.org",
                      amazon_tracking_id: "esd-#{n+1}-20",
                      shortname: "sc#{n+1}")

      Merchant.create!(name: "Sample Merchant #{n+1}",
                       link: "http://sample-merchant-#{n+1}.com",
                       img_url: "http://stevesaporta.com/sample_merchant_logo.png",
                       img_alt: "Sample Merchant #{n+1}",
                       tracking_img: "http://stevesaporta.com/sample_merchant_logo.png",
                       percentage: ((n+1)/10))
    end
  end
end
