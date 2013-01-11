require 'spec_helper'

describe "StaticPages" do

  describe "About page" do

    it "should have the title 'About'" do
      visit about_path
      page.should have_selector('title', text:  "About")
    end
  end

  describe "Privacy page" do

    it "should have the title 'Privacy'" do
      visit privacy_path
      page.should have_selector('title', text: "Privacy")
    end
  end
end
