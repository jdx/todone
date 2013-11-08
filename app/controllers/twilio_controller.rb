class TwilioController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def sms
    task = Task.new
    task.name = params["Body"]
    task.user_id = User.find_by_phone_number(params["From"])
    task.save!
    render text: "Task successfully saved!", content_type: "text/plain"
  end

end