class CreateMessages < ActiveRecord::Migration[5.1]

	def change
    create_table :messages do |t|

			t.string :title
			t.string :percent

      t.timestamps
    end
  end

end