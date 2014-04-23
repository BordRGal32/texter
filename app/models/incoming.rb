class Incoming


  def self.send_message(number)
    number_array = [number, number]

    Message.create(:to => number_array, :from => "8027780526", :body => "This number cannot receive texts")
  end
end
