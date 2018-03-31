class CreateChannelService

def self.perform(permitted_params)
  new.perform(permitted_params)
end

def perform(permitted_params)
  persist(permitted_params)
end

private

def persist(permitted_params)
  channel = Channel.create(permitted_params)
  channel
end

end
