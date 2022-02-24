class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :password
      t.integer :furniture_id

      t.timestamps
    end
  end
end
