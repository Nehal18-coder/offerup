class Api::V1::StatusesController < Api::V1::GraphitiController
  def index
    statuses = StatusResource.all(params)
    respond_with(statuses)
  end

  def show
    status = StatusResource.find(params)
    respond_with(status)
  end

  def create
    status = StatusResource.build(params)

    if status.save
      render jsonapi: status, status: 201
    else
      render jsonapi_errors: status
    end
  end

  def update
    status = StatusResource.find(params)

    if status.update_attributes
      render jsonapi: status
    else
      render jsonapi_errors: status
    end
  end

  def destroy
    status = StatusResource.find(params)

    if status.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: status
    end
  end
end
