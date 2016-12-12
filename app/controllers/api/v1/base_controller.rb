require 'application_responder'

class Api::V1::BaseController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json

  protect_from_forgery with: :exception
end
