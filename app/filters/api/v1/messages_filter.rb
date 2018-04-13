class Api::V1::MessagesFilter < Api::V1::BaseFilter
  def collection
    messages = self.resource

    unless params[:message_id].blank?
      messages = messages.where('messages.id = ?', params[:message_id])
    end

   return self.with_associations(messages.order(id: :desc))
  end
end
