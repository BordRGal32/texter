class IncomingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    number = params["From"][1..-1]
    Incoming.send_message(number)
  end

end

