require 'spec_helper'

describe "Charities" do

  describe "Index" do

    before(:all) {
      FactoryGirl.reload
      31.times { FactoryGirl.create(:charity) }
    }
    after(:all)  { Charity.delete_all }

    it "should display Sample Charity 1" do
      visit charities_path
      page.should have_content("Sample Charity 1")
    end

    it "should have a link to Sample Charity 1's website" do
      visit charities_path
      page.should have_selector("a", text: "View website", href: "http://sample-charity-1.org")
    end

    it "should paginate" do
      visit charities_path page: "2"
      page.should have_content("Sample Charity 31")
    end

    it "should allow skipping to the list of merchants without selecting a charity" do
      visit charities_path
      click_link "Skip this. I just want to shop without selecting a charity."
      page.should have_content("Your purchase can benefit the charity of your choice")
    end

    it "should allow selecting a charity" do
      visit charities_path
      click_link "Sample Charity 1"
      page.should have_content("Sample Charity 1 will receive a donation")
    end
  end
end
