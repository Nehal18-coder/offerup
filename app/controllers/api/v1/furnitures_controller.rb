class Api::V1::FurnituresController < Api::V1::GraphitiController
  def index
    furnitures = FurnitureResource.all(params)
    respond_with(furnitures)
  end

  def show
    furniture = FurnitureResource.find(params)
    respond_with(furniture)
  end

  def create
    furniture = FurnitureResource.build(params)

    if furniture.save
      render jsonapi: furniture, status: 201
    else
      render jsonapi_errors: furniture
    end
  end

  def update
    furniture = FurnitureResource.find(params)

    if furniture.update_attributes
      render jsonapi: furniture
    else
      render jsonapi_errors: furniture
    end
  end

  def destroy
    furniture = FurnitureResource.find(params)

    if furniture.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: furniture
    end
  end
end
