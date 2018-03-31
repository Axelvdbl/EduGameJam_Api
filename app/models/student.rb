class Student < ApplicationRecord

	belongs_to :channels

	def render_api
		{
			id: self.id,
			created_at: self.created_at,
			firstname: self.firstname,
			lastname: self.lastname,
			channels_id: self.channels_id
		}
	end

end
