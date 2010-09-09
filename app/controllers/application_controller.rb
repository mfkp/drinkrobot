class ApplicationController < ActionController::Base
  has_mobile_fu(true)
  protect_from_forgery
  layout 'application'
end
