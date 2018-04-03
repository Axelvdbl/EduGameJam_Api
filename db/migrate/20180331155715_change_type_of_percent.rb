class ChangeTypeOfPercent < ActiveRecord::Migration[5.1]

	def change
		remove_column :messages, :percent
		add_column :messages, :percent, :boolean, default: true
  end

end
