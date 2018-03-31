class Api::V1::ChannelsFilter < Api::V1::BaseFilter
  def collection
    channels = self.resource

    unless params[:teachers_id].blank?
      channels = channels.where('channels.teachers_id = ?', params[:teachers_id])
    end

		unless params[:id].blank?
      channels = channels.where('channels.id = ?', params[:id])
    end

   return self.with_associations(channels)
  end
end
