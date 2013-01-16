require 'spec_helper'

describe "Merchants" do

  describe "Index" do

    before(:all) {
      FactoryGirl.reload
      31.times { FactoryGirl.create(:merchant) }
      FactoryGirl.create(:charity)
    }
    after(:all)  {
      Merchant.delete_all
      Charity.delete_all
    }

    before {
      visit charities_path
      click_link "Sample Charity 1"
    }

    it "should display Sample Merchant 1" do
      page.should have_selector("a", href: "/merchants/1/shop")
      page.should have_selector("img", src: "http://stevesaporta.com/sample_charity_logo.png")
      page.should have_content("Up to 1.0% donation")
    end

    it "should paginate" do
      visit merchants_path page: "2"
      page.should have_selector("a", href: "/merchants/31/shop")
    end

    it "should allow selecting a different charity" do
      page.should have_link("Select a different charity")
    end
  end
end
