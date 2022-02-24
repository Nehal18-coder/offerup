class FurnituresController < ApplicationController
  before_action :set_furniture, only: %i[show edit update destroy]

  def index
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(distinct: true).includes(:user,
                                                     :status).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@furnitures.where.not(google_map_latitude: nil)) do |furniture, marker|
      marker.lat furniture.google_map_latitude
      marker.lng furniture.google_map_longitude
    end
  end

  def show; end

  def new
    @furniture = Furniture.new
  end

  def edit; end

  def create
    @furniture = Furniture.new(furniture_params)

    if @furniture.save
      message = "Furniture was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @furniture, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @furniture.update(furniture_params)
      redirect_to @furniture, notice: "Furniture was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @furniture.destroy
    message = "Furniture was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to furnitures_url, notice: message
    end
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params.require(:furniture).permit(:title, :photo, :category, :price,
                                      :google_map, :user_id, :status_id)
  end
end
