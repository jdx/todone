class TwilioController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def sms
    render text: "I got your text! You said #{params["Body"]}", content_type: "text/plain"
  end

end