require 'spec_helper'

describe ContactForm do
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subject) }
  it { should respond_to(:body) }
end
