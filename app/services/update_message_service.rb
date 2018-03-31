class UpdateMessageService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private
  def persist(permitted_params, id)
    message = Message.find_by_id(id)
    message.update_attributes permitted_params
    message
  end

end
