class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  # GET /furnitures
  def index
    @furnitures = Furniture.all
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
      redirect_to @furniture, notice: 'Furniture was successfully created.'
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
    redirect_to furnitures_url, notice: 'Furniture was successfully destroyed.'
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
