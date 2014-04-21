require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :username }
  it { should have_many :contacts }
end
