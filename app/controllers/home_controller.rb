class HomeController < ApplicationController
  def index
    @properties = Property.includes(:favourited_users).all
  end
end
