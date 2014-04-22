require 'spec_helper'

describe Message, :vcr => true do
  it "sends a message" do
    message = Message.new({:body => "You are awesome LOL!", :to => ["", "5036102940", "5036102940"], :from => "8027780526"})
    message.save.should be_true
  end

  it "doesn't save a message if twilio gives an error" do
    message = Message.new({:body => "You are awesome LOL!", :to => ["", "1111", "1111"], :from => "8027780526"})
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111 is not a valid phone number."]
  end

  it "sends more than one message" do
    message = Message.new({:body => "You are awesome LOL!", :to => ["", "5036102940", "9253157134"], :from => "8027780526"})
    message.save.should eq true
  end

  it "throws an error if one number is wrong" do
    message = Message.new({:body => "You are awesome LOL!", :to => ["", "1234", "5036102940"], :from => "8027780526"})
    message.save.should eq false
    message.errors.messages[:base].should eq ["The 'To' number 1234 is not a valid phone number."]
  end
end
