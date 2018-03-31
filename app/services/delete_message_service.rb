class DeleteMessageService
  def self.perform id
    new.perform id
  end

  def perform id
    persist id
  end

  private

  def persist id
    message = Message.find_by_id(id)
    message.destroy
  end

end
