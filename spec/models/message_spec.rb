require 'spec_helper'

describe Message, :vcr => true do
  it "sends a message a message" do
    message = FactoryGirl.build(:message)
    message.save.should be_true
  end

  it "does't save a message if twilio gives an error" do
    message = Message.new(:body => "You are awesome LOL!", :to => "1111", :from => "8027780526")
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111 is not a valid phone number."]
  end
end
