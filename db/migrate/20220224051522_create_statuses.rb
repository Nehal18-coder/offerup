class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :furniture_id

      t.timestamps
    end
  end
end
