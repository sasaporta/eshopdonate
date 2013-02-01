require 'spec_helper'

describe "Charities" do

  before(:all) {
    FactoryGirl.reload
    31.times { FactoryGirl.create(:charity) }
  }

  before { visit charities_path }

  after(:all)  { Charity.delete_all }

  describe "Index" do

    it "should display Sample Charity 1" do
      page.should have_content("Sample Charity 1")
    end

    it "should have a link to Sample Charity 1's website" do
      page.should have_selector("a", text: "View website", href: "http://sample-charity-1.org")
    end

    it "should paginate" do
      visit charities_path page: "2"
      page.should have_content("Sample Charity 31")
    end

    it "should allow skipping to the list of merchants without selecting a charity" do
      click_link "Skip this. I just want to shop without selecting a charity."
      page.should have_content("Your purchase can benefit the charity of your choice")
    end

    it "should allow selecting a charity" do
      click_link "Sample Charity 1"
      page.should have_content("Sample Charity 1 will receive a donation")
    end

    it "should not display Edit or Delete links before signin" do
      page.should_not have_link("Edit")
      page.should_not have_link("Delete")
    end
  end

  describe "Admin" do
    before { sign_in }

    it "should display Edit and Delete links" do
      page.should have_link("Edit")
      page.should have_link("Delete")
    end

    it "opens the Edit Charity page" do
      edit_first_charity
      page.should have_selector("input", id: "charity_name", value: "Sample Charity 1")
    end

    it "saves changes to a charity" do
      edit_first_charity
      fill_in "charity_name", with: "Sample Charity 1a"
      fill_in "charity_url", with: "http://sample-charity-1a.org"
      fill_in "charity_amazon_tracking_id", with: "esd-sc1a-20"
      fill_in "charity_shortname", with: "sc1a"
      click_button "Save"
      edit_first_charity
      page.should have_xpath("//input[@value='Sample Charity 1a']")
      page.should have_xpath("//input[@value='http://sample-charity-1a.org']")
      page.should have_xpath("//input[@value='esd-sc1a-20']")
      page.should have_xpath("//input[@value='sc1a']")
    end

    it "deletes a charity" do
      expect { find(:xpath, "//a[contains(@data-confirm, 'Delete Sample Charity 1')]").click }.to change(Charity, :count).by(-1)
    end
  end

  describe "Shortname routing" do
    it "selects a charity by its shortname" do
      visit "#{charities_path}/#{Charity.first.shortname}"
      page.should have_content("Sample Charity 1 will receive a donation")
    end

    it "redirects to 404 with an invalid shortname" do
      lambda {
        visit "#{charities_path}/foo"
      }.should raise_error(ActionController::RoutingError) 
    end
  end
end

def edit_first_charity
  find(:xpath, "//a[contains(@href, '/charities/#{Charity.first.id}/edit')]").click
end
