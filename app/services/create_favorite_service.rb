class CreateFavoriteService

def self.perform(permitted_params)
  new.perform(permitted_params)
end

def perform(permitted_params)
  persist(permitted_params)
end

private

def persist(permitted_params)
  favorite = Favorite.create(permitted_params)
  favorite
end

end
