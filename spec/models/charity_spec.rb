require 'spec_helper'

describe Charity do
  before { @charity = Charity.new() }

  subject { @charity }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
end
