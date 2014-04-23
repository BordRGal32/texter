require 'spec_helper'

describe Incoming do
  it 'sends a message when a number is passed to it.' do
    message = Incoming.send_message("2148837765")
    message.save.should eq true
  end
end
