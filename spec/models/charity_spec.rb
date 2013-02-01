require 'spec_helper'

describe Charity do
  before { @charity = Charity.new(name: "Sample Charity 1", url: "http://samplecharity1.org", amazon_tracking_id: "esd-sc1-20", shortname: "sc1") }

  subject { @charity }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:amazon_tracking_id) }
  it { should respond_to(:shortname) }

  it { should be_valid }

  describe "when name is not present" do
    before { @charity.name = " " }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @charity.url = " " }
    it { should_not be_valid }
  end

  describe "when amazon_tracking_id is not present" do
    before { @charity.amazon_tracking_id = " " }
    it { should_not be_valid }
  end

  describe "when shortname is not present" do
    before { @charity.shortname = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @charity.name = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when url is too long" do
    before { @charity.url = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when amazon_tracking_id is too long" do
    before { @charity.amazon_tracking_id = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when shortname is too long" do
    before { @charity.shortname = "a" * 51 }
    it { should_not be_valid }
  end
end
