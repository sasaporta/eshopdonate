require 'spec_helper'

describe "Header" do

  before { visit root_path }

  it "should link to the About page" do
    click_link "About"
    page.should have_selector("title", text: "About")
  end

  it "should link to the Privacy page" do
    click_link "Privacy"
    page.should have_selector("title", text: "Privacy")
  end

  it "should link to the Contact page" do
    click_link "Contact"
    page.should have_selector("title", text: "Contact")
  end

  it "should link to the Charities page" do
    click_link "Charities"
    page.should have_selector("title", text: "Select a Charity")
  end

  describe "link to the Merchants page" do
    before do
      FactoryGirl.reload
      FactoryGirl.create(:charity)
      click_link "Charities"
      click_link "Sample Charity 1"
    end

    it "should link to the Merchants page after selecting a charity" do
      click_link "Shop"
      page.should have_selector("title", text: "All Merchants")
    end
  end

  it "should link to the Sign In page" do
    click_link "Sign in"
    page.should have_selector("h2", text: "Sign in")
  end

  describe "After signin" do
    before { sign_in }

    it "should link to the Sign Out page" do
      click_link "Sign out"
      page.should have_link("Sign in")
    end
  end
end
