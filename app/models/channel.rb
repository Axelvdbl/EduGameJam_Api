class Channel < ApplicationRecord

	has_many :student
	belongs_to :teachers

	def render_api
		{
			id: self.id,
			created_at: self.created_at,
			name: self.name,
			is_active: self.is_active,
			teachers_id: self.teachers_id
		}
	end

end
