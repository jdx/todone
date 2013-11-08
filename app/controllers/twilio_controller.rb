class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def sms
    render text: "yo buddy!, you said #{params["Body"]}", content_type: 'text/plain'
  end
end
