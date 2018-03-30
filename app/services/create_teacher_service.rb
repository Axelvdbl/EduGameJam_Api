class CreateTeacherService

def self.perform(permitted_params)
  new.perform(permitted_params)
end

def perform(permitted_params)
  persist(permitted_params)
end

private

def persist(permitted_params)
  teacher = Teacher.create(permitted_params)
  teacher
end

end
