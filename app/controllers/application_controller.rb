require 'line/bot'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :validate_signature, except: [:new, :create]

  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end  
end
