class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  # GET /furnitures
  def index
    @furnitures = Furniture.all
    @location_hash = Gmaps4rails.build_markers(@furnitures.where.not(:google_map_latitude => nil)) do |furniture, marker|
      marker.lat furniture.google_map_latitude
      marker.lng furniture.google_map_longitude
      marker.infowindow "<h5><a href='/furnitures/#{furniture.id}'>#{furniture.id}</a></h5><small>#{furniture.google_map_formatted_address}</small>"
    end
  end

  # GET /furnitures/1
  def show
  end

  # GET /furnitures/new
  def new
    @furniture = Furniture.new
  end

  # GET /furnitures/1/edit
  def edit
  end

  # POST /furnitures
  def create
    @furniture = Furniture.new(furniture_params)

    if @furniture.save
      message = 'Furniture was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @furniture, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /furnitures/1
  def update
    if @furniture.update(furniture_params)
      redirect_to @furniture, notice: 'Furniture was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /furnitures/1
  def destroy
    @furniture.destroy
    message = "Furniture was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to furnitures_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture
      @furniture = Furniture.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def furniture_params
      params.require(:furniture).permit(:title, :photo, :category, :price, :google_map, :user_id, :status_id)
    end
end
