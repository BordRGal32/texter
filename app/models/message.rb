class Message < ActiveRecord::Base
  before_create :send_message

  private
  def send_message(array)
    begin
      array.each do |phone|
        response = RestClient::Request.new(
          :method => :post,
          :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          :user => ENV["TWILIO_ACCOUNT_SID"],
          :password => ENV["TWILIO_AUTH_TOKEN"],
          :payload => { :Body => body,
                        :To => phone.phone_number,
                        :From => from }

          ).execute
      end
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
