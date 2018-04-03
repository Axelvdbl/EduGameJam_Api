class Api::V1::FavoritesFilter < Api::V1::BaseFilter

  def collection
    favorites = self.resource

    unless params[:message_id].blank? && params[:teacher_id].blank?
      favorites = favorites.where('favorites.message_id = ? AND teacher_id = ?', params[:message_id], params[:teacher_id])
    end

    if !params[:message_id]
      unless params[:teacher_id].blank?
        favorites = RealEstate.joins("INNER JOIN favorites ON favorites.message_id = messages.id
                                      INNER JOIN teachers ON teachers.id = favorites.teacher_id WHERE teachers.id = ", params[:teacher_id])
      end
    end

   return self.with_associations(favorites)
  end

end
