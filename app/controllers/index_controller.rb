class IndexController < ApplicationController
  def index
    respond_to do |format|
      #format.html # index.html.erb
      format.mobile # index.mobile.erb
      format.js
    end
  end
  def about
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end
