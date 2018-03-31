class Message < ApplicationRecord

	def render_api
		{
			id: self.id,
			created_at: created_at,
			title: self.title,
			percent: self.percent
		}
	end

end
