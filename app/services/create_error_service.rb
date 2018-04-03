class CreateErrorService

def self.perform(permitted_params)
  new.perform(permitted_params)
end

def perform(permitted_params)
  persist(permitted_params)
end

private

def persist(permitted_params)
  error = Error.create(permitted_params)
  error
end

end
