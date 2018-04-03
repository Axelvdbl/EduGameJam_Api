class Api::V1::ErrorsController < Api::V1::BaseController

  def index
    errors = Api::V1::ErrorsFilter.new(Error.all, params).collection
    render :json => array_serializer(errors)
  end

  def show
    error = Error.find_by_id(params[:id])
    render :json => error.render_api
  end

  def create
    error = CreateErrorService.perform(permitted_params)
    return api_error(status: 422, errors: error.errors) unless error.save
    render(
      json: error,
      status: 201,
      location: api_v1_error_path(error.id)
    )
  end

  def update
    error = UpdateErrorService.perform(permitted_params, params[:id])
    return api_error(status: 422, errors: error.errors) unless error.save
    render(
      json: error.render_api,
      status: 201,
      location: api_v1_error_path(error.id)
    )
  end

  def destroy
   error = DeleteErrorService.perform(params[:id])
   return api_error(status: 422, errors: error.errors) unless error.destroyed?
   render(
     json: {},
     status:   204,
     location: api_v1_error_path(error.id)
   )
  end

  private

  def permitted_params
    params.require(:error).permit(
      :error,
      :message_id
    )
  end

  def array_serializer errors
    errors_serialized = Array.new
    errors.each do |error|
      errors_serialized.push(error.render_api)
    end
    errors_serialized
  end

end
