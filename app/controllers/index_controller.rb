class IndexController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end
