class UpdateChannelService

  def self.perform(permitted_params, id)
    new.perform(permitted_params, id)
  end

  def perform(permitted_params, id)
    persist(permitted_params, id)
  end

  private
  def persist(permitted_params, id)
    channel = Channel.find_by_id(id)
    channel.update_attributes permitted_params
    channel
  end

end
