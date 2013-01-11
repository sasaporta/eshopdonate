require 'spec_helper'

describe Merchant do
  before { @merchant = Merchant.new() }

  subject { @merchant }

  it { should respond_to(:name) }
  it { should respond_to(:url) }

end
