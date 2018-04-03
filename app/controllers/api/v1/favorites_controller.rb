class Api::V1::FavoritesController < Api::V1::BaseController

  def index
    favorites = Api::V1::FavoritesFilter.new(Favorite.all, params).collection
    render :json => array_serializer(favorites)
  end

  def show
    favorite = Favorite.find_by_id(params[:id])
    render :json => favorite.render_api
  end

  def create
    favorite = CreateFavoriteService.perform(permitted_params)
    return api_error(status: 422, errors: favorite.errors) unless favorite.save
    render(
      json: favorite,
      status: 201,
      location: api_v1_favorite_path(favorite.id)
    )
  end

  def update
    favorite = UpdateFavoriteService.perform(permitted_params, params[:id])
    return api_error(status: 422, errors: favorite.errors) unless favorite.save
    render(
      json: favorite.render_api,
      status: 201,
      location: api_v1_favorite_path(favorite.id)
    )
  end

  def destroy
   favorite = DeleteFavoriteService.perform(params[:id])
   return api_error(status: 422, errors: favorite.errors) unless favorite.destroyed?
   render(
     json: {},
     status:   204,
     location: api_v1_favorite_path(favorite.id)
   )
  end

  private

  def permitted_params
    params.require(:favorite).permit(
      :teacher_id,
      :message_id
    )
  end

  def array_serializer favorites
    favorites_serialized = Array.new
    favorites.each do |favorite|
      favorites_serialized.push(favorite.render_api)
    end
    favorites_serialized
  end

end
