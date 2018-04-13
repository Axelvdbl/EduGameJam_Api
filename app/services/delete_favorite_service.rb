class DeleteFavoriteService

  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    favorite = Favorite.find_by_id(id)
    favorite.destroy
  end

end
