require 'spec_helper'

describe Merchant do
  before { @merchant = Merchant.new() }

  subject { @merchant }

  it { should respond_to(:name) }
  it { should respond_to(:link) }
  it { should respond_to(:percentage) }
  it { should respond_to(:img_url) }
  it { should respond_to(:img_alt) }
  it { should respond_to(:tracking_img) }
end
