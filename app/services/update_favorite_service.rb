class UpdateFavoriteService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private
  def persist(permitted_params, id)
    favorite = Favorite.find_by_id(id)
    favorite.update_attributes permitted_params
    favorite
  end

end
