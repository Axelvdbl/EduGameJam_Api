class AddIsActiveToChannels < ActiveRecord::Migration[5.1]

	def change
		add_column :channels, :is_active, :boolean, default: false
  end

end
