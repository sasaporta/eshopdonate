require 'spec_helper'

describe "Merchants" do

  before(:all) {
    FactoryGirl.reload
    31.times { FactoryGirl.create(:merchant) }
    FactoryGirl.create(:charity)
  }

  after(:all)  {
    Merchant.delete_all
    Charity.delete_all
  }

  describe "Index" do

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

  describe "Admin" do

    before do
      sign_in
      visit charities_path
      click_link "Sample Charity 1"
    end

    it "should display Edit and Delete links" do
      page.should have_link("Edit")
      page.should have_link("Delete")
    end

    it "opens the Edit Mechant page" do
      edit_first_merchant
      page.should have_selector("input", id: "merchant_name", value: "Sample Merchant 1b")
    end

    it "saves changes to a merchant" do
      edit_first_merchant
      fill_in "merchant_name", with: "Sample Merchant 1a"
      fill_in "merchant_link", with: "http://sample-merchant-1a.com"
      fill_in "merchant_percentage", with: "1.23"
      fill_in "merchant_img_url", with: "http://stevesaporta.com/sample_charity_logo-a.png"
      fill_in "merchant_img_alt", with: "Sample Merchant 1a"
      fill_in "merchant_tracking_img", with: "http://stevesaporta.com/sample_charity_logo-a.png"
      click_button "Save"
      edit_first_merchant
      page.should have_xpath("//input[@value='Sample Merchant 1a']")
      page.should have_xpath("//input[@value='http://sample-merchant-1a.com']")
      page.should have_xpath("//input[@value='1.23']")
      page.should have_xpath("//input[@value='http://stevesaporta.com/sample_charity_logo-a.png']")
    end

    it "deletes a merchant" do
      expect { find(:xpath, "//a[contains(@data-confirm, 'Delete Sample Merchant 1')]").click }.to change(Merchant, :count).by(-1)
    end
  end
end

def edit_first_merchant
  find(:xpath, "//a[contains(@href, '/merchants/#{Merchant.first.id}/edit')]").click
end
