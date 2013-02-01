require 'spec_helper'

describe Merchant do
  before { @merchant = Merchant.new(name: "Sample Merchant 1", link: "http://sample-merchant-1}.com", img_url: "http://stevesaporta.com/sample_merchant_logo.png", img_alt: "Sample Merchant 1", tracking_img: "http://stevesaporta.com/sample_merchant_logo.png", percentage: 10) }

  subject { @merchant }

  it { should respond_to(:name) }
  it { should respond_to(:link) }
  it { should respond_to(:percentage) }
  it { should respond_to(:img_url) }
  it { should respond_to(:img_alt) }
  it { should respond_to(:tracking_img) }

  it { should be_valid }

  describe "when name is not present" do
    before { @merchant.name = " " }
    it { should_not be_valid }
  end

  describe "when link is not present" do
    before { @merchant.link = " " }
    it { should_not be_valid }
  end

  describe "when img_url is not present" do
    before { @merchant.img_url = " " }
    it { should_not be_valid }
  end

  describe "when img_alt is not present" do
    before { @merchant.img_alt = " " }
    it { should_not be_valid }
  end

  describe "when tracking_img is not present" do
    before { @merchant.tracking_img = " " }
    it { should_not be_valid }
  end

  describe "when percentage is not present" do
    before { @merchant.percentage = nil }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @merchant.name = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when link is too long" do
    before { @merchant.link = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when img_url is too long" do
    before { @merchant.img_url = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when img_alt is too long" do
    before { @merchant.img_alt = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when tracking_img is too long" do
    before { @merchant.tracking_img = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when percentage format is invalid" do
    it "should be invalid" do
      percentages = %w[-1 1.234 100 a]
      percentages.each do |invalid_percentage|
        @merchant.percentage = invalid_percentage
        @merchant.should_not be_valid
      end
    end
  end

  describe "when percentage format is valid" do
    it "should be valid" do
      percentages = %w[0 1.23 99.99]
      percentages.each do |valid_percentage|
        @merchant.percentage = valid_percentage
        @merchant.should be_valid
      end
    end
  end
end
