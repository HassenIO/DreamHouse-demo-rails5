class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @properties = current_user.properties.order(id: :desc)
    @page_title = 'Your Properties'
    render 'properties/index'
  end

end
