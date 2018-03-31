class CreateStudentService

def self.perform(permitted_params)
  new.perform(permitted_params)
end

def perform(permitted_params)
  persist(permitted_params)
end

private

def persist(permitted_params)
  student = Student.create(permitted_params)
  student
end

end
