class PropertiesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_property, only: [:show, :edit]
  before_action :get_property_of_user, only: [:update, :destroy]

  # GET /properties
  def index
    @properties = Property.all
  end

  # GET /properties/1
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    redirect_to(user_properties_path, alert: "You are not the owner of this property") if @property.user != current_user
  end

  # POST /properties
  def create
    @property = current_user.properties.new(property_params)

    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private

  # Get a property given its ID
  def get_property
    @property = Property.find(params[:id])
  end

  # Get user property given user and property ID for action
  def get_property_of_user
    @property = current_user.properties.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:title, :address, :description, :features, :images, :price)
  end
end
