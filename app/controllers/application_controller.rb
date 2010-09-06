require 'is_it_mobile' 
class ApplicationController < ActionController::Base
  include IsItMobile::ForRails
  protect_from_forgery
  layout 'application'
end
