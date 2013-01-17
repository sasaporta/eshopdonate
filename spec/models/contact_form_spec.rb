require 'spec_helper'

describe ContactForm do

  before { @contact_form = ContactForm.new(name: "Joe Schmo", email: "joe@example.com", subject: "Example subject", body: "This is\na test") }

  subject { @contact_form }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subject) }
  it { should respond_to(:body) }

  it { should be_valid }

  describe "when name is not present" do
    before { @contact_form.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @contact_form.email = " " }
    it { should_not be_valid }
  end

  describe "when subject is not present" do
    before { @contact_form.subject = " " }
    it { should_not be_valid }
  end

  describe "when body is present" do
    before { @contact_form.body = " " }
    it { should be_valid }
  end

  describe "when name is too long" do
    before { @contact_form.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @contact_form.email = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when subject is too long" do
    before { @contact_form.subject = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when body is too long" do
    before { @contact_form.body = "a" * 1001 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @contact_form.email = invalid_address
        @contact_form.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @contact_form.email = valid_address
        @contact_form.should be_valid
      end      
    end
  end
end
