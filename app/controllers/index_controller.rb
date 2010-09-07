class IndexController < ApplicationController
  def index
    respond_to do |format|
      format.mobile # index.mobile.erb
      format.html # index.html.erb
      format.js
    end
  end
  def about
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
  def mobileview
  	session[:mobile_view] = !session[:mobile_view]
  	redirect_to :controller => 'index', :action => 'index'
  end
end
