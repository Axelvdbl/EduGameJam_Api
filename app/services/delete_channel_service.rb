class DeleteChannelService
  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    channel = Channel.find_by_id(id)
    channel.destroy
  end

end
