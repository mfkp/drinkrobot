class ApplicationController < ActionController::Base
  has_mobile_fu
  protect_from_forgery
  layout 'application'
end
